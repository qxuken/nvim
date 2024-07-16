return {
  {
    'nvim-neotest/neotest',
    lazy = true,
    event = 'VimEnter',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'thenbe/neotest-playwright',
      'vim-test/vim-test',
      'nvim-neotest/neotest-vim-test',
      'mrcjkb/rustaceanvim',
      'nvim-neotest/neotest-jest',
    },
    keys = {
      {
        '<leader>nf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = 'NeoTest File',
      },
      {
        '<leader>nn',
        function()
          require('neotest').run.run()
        end,
        desc = 'NeoTest Nearest',
      },
      {
        '<leader>ns',
        function()
          require('neotest').run.stop()
        end,
        desc = 'NeoTest Stop',
      },
      {
        '<leader>na',
        function()
          require('neotest').run.attach()
        end,
        desc = 'NeoTest Attach',
      },
      {
        '<leader>np',
        function()
          ---@diagnostic disable-next-line: undefined-field
          require('neotest').playwright.attachment()
        end,
        desc = 'NeoTest Playwright attachment',
      },
    },
    config = function()
      require('which-key').add {
        { '<leader>n', group = 'Neotest' },
      }

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
          require 'neotest-jest' {
            env = { CI = true, FUNCTIONAL = true },
            -- jestCommand = 'npm test --',
            -- jestConfigFile = 'custom.jest.config.ts',
            -- cwd = function()
            --   return vim.fn.getcwd()
            -- end,
          },
          require 'rustaceanvim.neotest',
        },
      }
    end,
  },
}
