return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'thenbe/neotest-playwright',
      'vim-test/vim-test',
      'nvim-neotest/neotest-vim-test',
    },
    keys = {
      {
        '<leader>nf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = '[N]eoTest [F]ile',
      },
      {
        '<leader>nn',
        function()
          require('neotest').run.run()
        end,
        desc = '[N]eoTest [N]earest',
      },
      {
        '<leader>ns',
        function()
          require('neotest').run.stop()
        end,
        desc = '[N]eoTest [S]top',
      },
      {
        '<leader>na',
        function()
          require('neotest').run.attach()
        end,
        desc = '[N]eoTest [A]ttach',
      },
      {
        '<leader>np',
        function()
          ---@diagnostic disable-next-line: undefined-field
          require('neotest').playwright.attachment()
        end,
        desc = '[N]eoTest [P]laywright attachment',
      },
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('neotest').setup {
        consumers = {
          playwright = require('neotest-playwright.consumers').consumers,
        },
        adapters = {
          require('neotest-playwright').adapter {
            options = {
              persist_project_selection = true,
              enable_dynamic_test_discovery = true,
            },
          },
          require 'neotest-vim-test' {},
        },
      }
    end,
  },
}
