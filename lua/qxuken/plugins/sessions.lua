return {
  -- Auto Session takes advantage of Neovim's existing session management capabilities to provide seamless automatic session management.
  {
    'rmagatti/auto-session',
    lazy = false,
    keys = {
      { '<leader>wr', '<cmd>SessionSearch<CR>', desc = 'Session search' },
      { '<leader>wS', '<cmd>SessionSave<CR>', desc = 'Save session' },
      { '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
    },
    opts = { suppressed_dirs = { '~/', '~/projects', '~/local-projects', '~/Downloads', '/' } },
    config = function(_, opts)
      require('auto-session').setup(opts)
      vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    end,
  },
}
