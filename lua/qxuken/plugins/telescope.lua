return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

      -- Live grep args picker for telescope
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = '^1.0.0',
      },
      { 'debugloop/telescope-undo.nvim' },
    },
    config = function()
      local lga_actions = require 'telescope-live-grep-args.actions'

      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          layout_strategy = 'vertical',
          layout_config = {
            width = 0.9,
            height = 0.95,
          },
        },
        pickers = {
          buffers = {
            sort_lastused = true,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            -- define mappings, e.g.
            mappings = { -- extend mappings
              i = {
                ['<C-k>'] = lga_actions.quote_prompt(),
                ['<C-i>'] = lga_actions.quote_prompt { postfix = ' --iglob ' },
              },
            },
          },
          undo = {
            -- telescope-undo.nvim config, see below
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'live_grep_args')
      pcall(require('telescope').load_extension, 'undo')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      local extensions = require('telescope').extensions
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help' })
      vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = 'Search Commands' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search Keymaps' })
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Search Files' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search Select Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search current Word' })
      vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Search by Grep' })
      vim.keymap.set('n', '<leader>sg', extensions.live_grep_args.live_grep_args, { desc = 'Search by Grep with args' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search Diagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search Resume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>j', builtin.jumplist, { desc = 'Open jumplist' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '  Find existing buffers' })
      vim.keymap.set('n', '<leader>u', extensions.undo.undo, { desc = 'Undo history' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = 'Search [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Search Neovim files' })
    end,
  },
}
