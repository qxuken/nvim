return {
  {
    'FabijanZulj/blame.nvim',
    config = function()
      require('blame').setup()

      vim.keymap.set('n', '<leader>bw', '<cmd>BlameToggle window<CR>', { desc = 'Toggle git Blame window' })
      vim.keymap.set('n', '<leader>bv', '<cmd>BlameToggle virtual<CR>', { desc = 'Toggle git Blame virtual' })
    end,
  },
}
