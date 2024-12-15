return {
  {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    config = function()
      require('notify').setup { render = 'minimal', fps = 144 }
      vim.notify = require 'notify'
    end,
  },

  {
    'j-hui/fidget.nvim',
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
    },
  },
}
