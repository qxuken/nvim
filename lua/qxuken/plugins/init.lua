return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    'rcarriga/nvim-notify',
    lazy = false,
    config = function()
      vim.notify = require 'notify'
    end,
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- See `:help gitsigns` to understand what the configuration keys do
  {
    'lewis6991/gitsigns.nvim',
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

  -- Effortlessly open the URL under the cursor
  {
    'sontungexpt/url-open',
    branch = 'mini',
    event = 'VeryLazy',
    cmd = 'URLOpenUnderCursor',
    keys = {
      { 'gx', '<esc>:URLOpenUnderCursor<cr>', desc = '[G]o to link under cursor' },
    },
    config = function()
      local status_ok, url_open = pcall(require, 'url-open')
      if not status_ok then
        return
      end
      url_open.setup {}
    end,
  },
}
