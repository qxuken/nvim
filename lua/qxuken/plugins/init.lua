return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    'rcarriga/nvim-notify',
    lazy = false,
    config = function()
      require('notify').setup { background_colour = '#000000' }
      vim.notify = require 'notify'
    end,
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Effortlessly open the URL under the cursor
  {
    'sontungexpt/url-open',
    branch = 'mini',
    event = 'VeryLazy',
    cmd = 'URLOpenUnderCursor',
    keys = {
      { 'gx', '<esc>:URLOpenUnderCursor<cr>', desc = 'Go to link under cursor' },
    },
    config = function()
      local status_ok, url_open = pcall(require, 'url-open')
      if not status_ok then
        return
      end
      url_open.setup {}
    end,
  },

  {
    'laytan/cloak.nvim',
    opts = {
      cloak_character = vim.g.have_nerd_font and '' or '*',
      patterns = {
        {
          file_pattern = '.env',
          cloak_pattern = '=.+',
          replace = nil,
        },
        {
          file_pattern = 'vault.yml',
          cloak_pattern = ':.+',
          replace = nil,
        },
      },
    },
  },
}
