return {
  {
    'stevearc/oil.nvim',
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    opts = {},
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    keys = {
      {
        '<leader>ea',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Add buffer to harpoon',
      },
      {
        '<leader>ed',
        function()
          require('harpoon'):list():remove()
        end,
        desc = 'Remove buffer from harpoon',
      },
      {
        '<leader>ee',
        function()
          local h = require 'harpoon'
          h.ui:toggle_quick_menu(h:list())
        end,
        desc = 'Open harpoon ui',
      },
      {
        '<M-1>',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'Select 1st harpoon item',
      },
      {
        '<leader>e1',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'Select 1st harpoon item',
      },
      {
        '<M-2>',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'Select 2nd harpoon item',
      },
      {
        '<leader>e2',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'Select 2nd harpoon item',
      },
      {
        '<M-3>',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'Select 3rd harpoon item',
      },
      {
        '<leader>e3',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'Select 3rd harpoon item',
      },
      {
        '<M-4>',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'Select 4th harpoon item',
      },
      {
        '<leader>e4',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'Select 4th harpoon item',
      },
      {
        '<M-5>',
        function()
          require('harpoon'):list():select(5)
        end,
        desc = 'Select 5th harpoon item',
      },
      {
        '<leader>e5',
        function()
          require('harpoon'):list():select(5)
        end,
        desc = 'Select 5th harpoon item',
      },
      {
        '[e',
        function()
          require('harpoon'):list():prev { ui_nav_wrap = true }
        end,
        desc = 'Go to prev harpoon',
      },
      {
        ']e',
        function()
          require('harpoon'):list():next { ui_nav_wrap = true }
        end,
        desc = 'Go to next harpoon',
      },
    },
    config = true,
  },
}
