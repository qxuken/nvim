return {
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
      { '<leader>pl', '<cmd>Lazy<cr>', desc = 'Lazy' },
    },
    config = function()
      require('which-key').setup { preset = 'helix' }

      -- Document existing key chains
      require('which-key').add {
        { '<leader>b', group = 'Buffer/Blame' },
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Document' },
        { '<leader>s', group = 'Search' },
        { '<leader>t', group = 'NvimTree' },
        { '<leader>w', group = 'Workspace' },
        { '<leader>h', group = 'Git hunks' },
        { '<leader>e', group = 'Harpoon' },
        { '<leader>p', group = 'Plugins' },
        { '<leader>y', group = 'Copy', icon = '󰆏' },
        { ']', group = 'Next' },
        { '[', group = 'Prev' },
        { 'z', group = 'Fold' },
      }
    end,
  },
}
