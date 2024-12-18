return {
  {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    config = function()
      require('notify').setup { render = 'minimal', fps = 144 }
      vim.notify = require 'notify'
      vim.cmd [[
        highlight link NotifyERRORBody NormalFloat
        highlight link NotifyWARNBody NormalFloat
        highlight link NotifyINFOBody NormalFloat
        highlight link NotifyDEBUGBody NormalFloat
        highlight link NotifyTRACEBody NormalFloat
      ]]
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
