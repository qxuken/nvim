return {
  {
    'rmagatti/auto-session',
    lazy = false,
    keys = {
      { '<leader>wr', '<cmd>SessionSearch<CR>', desc = '[Session] Search' },
      { '<leader>wS', '<cmd>SessionSave<CR>', desc = '[Session] Save' },
    },
    opts = { suppressed_dirs = { '~/', '~/projects', '~/local-projects', '~/Downloads', '/' } },
    config = function(_, opts)
      require('auto-session').setup(opts)
      vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    end,
    dependencies = { 'folke/snacks.nvim' },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          Snacks.toggle
            .new({
              id = 'session_autosave',
              name = '[Session] Autosave',
              get = function()
                return require('auto-session.config').auto_save
              end,
              set = function()
                return vim.cmd 'SessionToggleAutoSave'
              end,
            })
            :map '<leader>wa'
        end,
      })
    end,
  },
}
