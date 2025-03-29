return {
  {
    'ibhagwan/fzf-lua',
    event = 'VimEnter',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('fzf-lua').setup {
        winopts = {
          backdrop = 100,
          fullscreen = true,
          preview = {
            vertical = 'down:45%',
            horizontal = 'right:40%',
            layout = 'horizontal',
          },
        },
        keymap = {
          builtin = {
            true,
            ['<C-d>'] = 'preview-page-down',
            ['<C-u>'] = 'preview-page-up',
            ['<M-d>'] = 'preview-down',
            ['<M-u>'] = 'preview-up',
          },
        },
      }
      require('fzf-lua').register_ui_select()
    end,
    keys = {
      -- {
      --   '<C-x><C-f>',
      --   '<cmd>FzfLua complete_path<cr>',
      --   silent = true,
      --   desc = 'Fuzzy complete path',
      --   mode = { 'n', 'v', 'i' },
      -- },
      {
        '<leader>sh',
        '<cmd>FzfLua helptags<cr>',
        silent = true,
        desc = 'Search Help',
      },
      {
        '<leader>sC',
        '<cmd>FzfLua commands<cr>',
        silent = true,
        desc = 'Search Commands',
      },
      {
        '<leader>sk',
        '<cmd>FzfLua keymaps<cr>',
        silent = true,
        desc = 'Search Keymaps',
      },
      {
        '<leader>f',
        '<cmd>FzfLua files<cr>',
        silent = true,
        desc = 'Search Files',
      },
      {
        '<leader>cT',
        '<cmd>FzfLua filetypes<cr>',
        silent = true,
        desc = 'Change syntax filetype',
      },
      {
        '<leader>cw',
        '<cmd>FzfLua grep_cword<cr>',
        silent = true,
        desc = 'Search current Word',
      },
      {
        '<leader>cW',
        '<cmd>FzfLua grep_cWORD<cr>',
        silent = true,
        desc = 'Search current WORD',
      },
      {
        '<leader>g',
        '<cmd>FzfLua live_grep_glob<cr>',
        silent = true,
        desc = 'Search by Grep',
      },
      {
        '<leader>sg',
        function()
          local dir = string.match(vim.fn.expand '%:.:h', '(%w+)')
          require('fzf-lua').live_grep_glob { cwd = dir }
        end,
        desc = 'Search by Grep Buffer Level One',
      },
      {
        '<leader>sG',
        function()
          local dir = vim.fn.expand '%:.:h'
          require('fzf-lua').live_grep_glob { cwd = dir }
        end,
        desc = 'Search by Grep Buffer Dir',
      },
      {
        '<leader>sd',
        '<cmd>FzfLua diagnostics_document<cr>',
        silent = true,
        desc = 'Search Diagnostics',
      },
      {
        '<leader>sD',
        '<cmd>FzfLua diagnostics_workspace<cr>',
        silent = true,
        desc = 'Search Diagnostics',
      },
      {
        '<leader>sr',
        '<cmd>FzfLua resume<cr>',
        silent = true,
        desc = 'Search Resume',
      },
      {
        '<leader>.',
        '<cmd>FzfLua oldfiles<cr>',
        silent = true,
        desc = 'Search File History',
      },
      {
        '<leader><leader>',
        '<cmd>FzfLua buffers<cr>',
        silent = true,
        desc = 'Search Buffers',
      },
      {
        '<leader>m',
        '<cmd>FzfLua marks<cr>',
        silent = true,
        desc = 'Search Marks',
      },
      {
        '<leader>m',
        '<cmd>FzfLua marks<cr>',
        silent = true,
        desc = 'Search Marks',
      },
      {
        '<leader>/',
        '<cmd>FzfLua blines<cr>',
        silent = true,
        desc = 'Fuzzily Search Buffer',
      },
      {
        '<leader>s/',
        '<cmd>FzfLua lines<cr>',
        silent = true,
        desc = 'Fuzzily Search Open Buffers',
      },
      {
        '<leader>sn',
        function()
          local dir = vim.fn.stdpath 'config'
          require('fzf-lua').files { cwd = dir }
        end,
        desc = 'Search Neovim files',
      },
    },
  },
}
