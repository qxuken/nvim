return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nightfox').setup {
        transparent = true,
        palettes = {
          all = {
            bg1 = 'NONE',
          },
        },
      }

      vim.cmd 'colorscheme nightfox'
    end,
  },
}
