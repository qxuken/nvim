return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'mfussenegger/nvim-dap',
      'j-hui/fidget.nvim',
      'ibhagwan/fzf-lua',
      'saghen/blink.cmp',
      { 'folke/lazydev.nvim', ft = 'lua', opts = {} },
    },
    keys = {
      { '<leader>pm', '<cmd>Mason<cr>', desc = 'Mason' },
    },
    config = function()
      vim.filetype.add { extension = { templ = 'templ' } }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('qx-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('fzf-lua').lsp_definitions, 'Goto Definition')

          -- Find references for the word under your cursor.
          map('gr', require('fzf-lua').lsp_references, 'Goto References')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('fzf-lua').lsp_implementations, 'Goto Implementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('fzf-lua').lsp_typedefs, 'Type Definition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('fzf-lua').lsp_document_symbols, 'Document Symbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('fzf-lua').lsp_workspace_symbols, 'Workspace Symbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>r', vim.lsp.buf.rename, 'Rename')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')

          map('<leader>cF', vim.lsp.buf.format, 'Code Format')

          -- toggle builtin hint inlay
          -- Replaced with snacks from folke
          -- map('<leader>cI', function()
          --   vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          -- end, 'Toggle Inlay Hint')

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap.
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        sqlls = {},
        sqlfmt = {},
        clangd = {},
        goimports = {},
        gopls = {},
        templ = {},
        delve = {},
        html = {
          filetypes = { 'html', 'templ' },
        },
        htmx = {
          filetypes = { 'html', 'templ' },
        },
        cssls = {},
        tailwindcss = {
          filetypes = { 'templ', 'astro', 'javascript', 'typescript', 'react' },
          init_options = { userLanguages = { templ = 'html' } },
        },
        codelldb = {},
        -- disabled due to rustacean plugin
        -- rust_analyzer = {},
        -- omnisharp = {},
        ts_ls = {},
        eslint = {},
        eslint_d = {},
        prettier = {},
        prettierd = {},
        jsonls = {},
        fixjson = {},
        markdown_oxide = {},
        markdownlint = {},
        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        stylua = {},
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities =
              vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}, require('blink.cmp').get_lsp_capabilities(server.capabilities))
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    keys = {
      {
        '<leader>Gb',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Toggle Breakpoint',
      },
      {
        '<leader>Gc',
        function()
          require('dap').continue()
        end,
        desc = 'Continue Execution',
      },
      {
        '<leader>Gq',
        function()
          require('dap').terminate()
        end,
        desc = 'Stop Execution',
      },
      {
        '<leader>GR',
        function()
          require('dap').restart()
        end,
        desc = 'Restart',
      },
      {
        '<leader>Gp',
        function()
          require('dap').step_back()
        end,
        desc = 'Step Back',
      },
      {
        '<leader>Go',
        function()
          require('dap').step_over()
        end,
        desc = 'Step Over',
      },
      {
        '<leader>Gi',
        function()
          require('dap').step_into()
        end,
        desc = 'Step Into',
      },
      {
        '<leader>Gr',
        function()
          require('dap').repl.open()
        end,
        desc = 'Repl Open',
      },
      {
        '<leader>Ge',
        function()
          require('dapui').eval()
        end,
        desc = 'Eval Cursor',
      },
      {
        '<leader>Gu',
        function()
          require('dapui').toggle()
        end,
        desc = 'Toggle ui',
      },
    },
    config = function()
      require('dapui').setup {}
      local dap, dapui = require 'dap', require 'dapui'
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
