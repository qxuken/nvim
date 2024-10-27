return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed.
      'nvim-telescope/telescope.nvim', -- optional
      'ibhagwan/fzf-lua', -- optional
      'echasnovski/mini.pick', -- optional
    },
    config = true,
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    keys = {
      { ']h', '<cmd>Gitsigns next_hunk<CR>', desc = 'Next git hunk' },
      { '[h', '<cmd>Gitsigns prev_hunk<CR>', desc = 'Prev git hunk' },
      -- { '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>', desc = 'Git hunk reset' },
      { '<leader>hd', '<cmd>Gitsigns diffthis<CR>', desc = 'Git hunk diff' },
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
    keys = {
      { '<leader>bw', '<cmd>BlameToggle window<CR>', desc = 'Toggle git Blame window' },
      { '<leader>bv', '<cmd>BlameToggle virtual<CR>', desc = 'Toggle git Blame virtual' },
    },
    opts = {},
  },
}
