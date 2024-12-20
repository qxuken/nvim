return {
  {
    'sindrets/diffview.nvim',
    keys = {
      { '<leader>bh', '<cmd>DiffviewFileHistory %<CR>', desc = 'Git history' },
      { '<leader>wd', '<cmd>DiffviewOpen<CR>', desc = 'Git diff' },
      { '<leader>wm', '<cmd>DiffviewOpen master...HEAD<CR>', desc = 'Git diff with main' },
    },
    opts = {},
  },
  {
    'NeogitOrg/neogit',
    keys = {
      { '<leader>bg', '<cmd>Neogit<CR>', desc = 'Neogit' },
      { '<leader>bl', '<cmd>NeogitLogCurrent<CR>', desc = 'File git log' },
      { '<leader>wc', '<cmd>NeogitCommit<CR>', desc = 'Git commit' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'ibhagwan/fzf-lua',
    },
    config = true,
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    keys = {
      { ']h', '<cmd>Gitsigns next_hunk<CR>', desc = 'Next git hunk' },
      { '[h', '<cmd>Gitsigns prev_hunk<CR>', desc = 'Prev git hunk' },
      { '<leader>hrr', '<cmd>Gitsigns reset_hunk<CR>', desc = 'Git hunk reset' },
      { '<leader>hd', '<cmd>Gitsigns diffthis<CR>', desc = 'Git hunk diff' },
      { '<leader>ds', '<cmd>Gitsigns stage_buffer<cr>', desc = 'git stage buffer' },
      { '<leader>hs', '<cmd>Gitsigns stage_hunk<cr>', desc = 'git stage hunk' },
      { '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<cr>', desc = 'git unstage hunk' },
      { '<leader>hv', '<cmd>Gitsigns select_hunk<cr>', desc = 'git select hunk' },
    },
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'FabijanZulj/blame.nvim',
    opts = {},
    dependencies = {
      'folke/snacks.nvim',
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          Snacks.toggle
            .new({
              id = 'blame_virtual',
              name = 'GitBlame Virtual',
              get = function()
                local blame = require 'blame'
                return blame.is_open() or false
              end,
              set = function()
                return vim.cmd 'BlameToggle virtual'
              end,
            })
            :map '<leader>bv'
          Snacks.toggle
            .new({
              id = 'blame_window',
              name = 'GitBlame Window',
              get = function()
                local blame = require 'blame'
                return blame.is_open() or false
              end,
              set = function()
                return vim.cmd 'BlameToggle window'
              end,
            })
            :map '<leader>bw'
        end,
      })
    end,
  },
}
