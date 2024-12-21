return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = '[UndoTree] Toggle' },
    },
  },

  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    keys = {
      { '<leader>sT', '<cmd>TodoFzfLua<cr>', desc = '[TODO] Search All' },
      {
        '<leader>st',
        function()
          require('todo-comments.fzf').todo { keywords = { 'TODO', 'FIX' } }
        end,
        desc = '[TODO] Search (TODO,FIX) only',
      },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },

  -- Effortlessly open the URL under the cursor
  {
    'sontungexpt/url-open',
    branch = 'mini',
    cmd = 'URLOpenUnderCursor',
    keys = {
      { 'gx', '<cmd>URLOpenUnderCursor<cr>', desc = '[Link] Go to' },
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

  {
    'marcussimonsen/let-it-snow.nvim',
    cmd = 'LetItSnow',
    opts = {
      delay = 500,
    },
  },
}
