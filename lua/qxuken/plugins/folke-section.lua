return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    keys = {
      {
        '<leader>bd',
        function()
          Snacks.bufdelete.delete()
        end,
        desc = '[Buffer] delete',
      },
      {
        '<leader>bo',
        function()
          Snacks.bufdelete.other()
        end,
        desc = '[Buffers] Delete Other',
      },
      {
        '<leader>bO',
        function()
          Snacks.bufdelete.other { force = true }
        end,
        desc = '[Buffers] Delete Other(Force)',
      },
      {
        '<leader>R',
        function()
          Snacks.rename.rename_file()
        end,
        desc = 'Rename File',
      },
    },
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      bufdelete = { enabled = true },
      dim = { enabled = true },
      scope = { enabled = true },
      toggle = { enabled = true },
      dashboard = { enabled = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          Snacks.toggle.dim():map '<leader>dd'
          Snacks.toggle.inlay_hints():map '<leader>cI'
        end,
      })
    end,
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

  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    config = true,
  },

  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },

      -- NOTE: Not realy for this plugin but why not)
      { '<leader>pl', '<cmd>Lazy<cr>', desc = '[Lazy] open' },
    },
    config = function()
      require('which-key').setup { preset = 'helix' }

      -- Document existing key chains
      require('which-key').add {
        { '<leader>b', group = 'Buffer/Blame' },
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Document' },
        { '<leader>s', group = 'Search' },
        { '<leader>t', group = 'Tabs' },
        { '<leader>w', group = 'Workspace' },
        { '<leader>h', group = 'Git hunks' },
        { '<leader>e', group = 'Harpoon', icon = '󱡀' },
        { '<leader>p', group = 'Plugins' },
        { '<leader>G', group = 'Debug' },
        { '<leader>y', group = 'Copy', icon = '󰆏' },
        { ']', group = 'Next' },
        { '[', group = 'Prev' },
        { 'z', group = 'Fold' },
      }
    end,
  },
}
