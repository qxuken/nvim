return {
  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').add {
        { '<leader>b', group = 'Buffer/Blame' },
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Document' },
        { '<leader>r', group = 'Rename' },
        { '<leader>s', group = 'Search' },
        { '<leader>t', group = 'NvimTree' },
        { '<leader>w', group = 'Workspace' },
        { '<leader>h', group = 'Git hunks' },
        { '<leader>e', group = 'Harpoon' },
        { '<leader>y', group = 'Copy', icon = '󰆏' },
        { ']', group = 'Next' },
        { '[', group = 'Prev' },
        { 'z', group = 'Fold' },
      }
    end,
  },
}
