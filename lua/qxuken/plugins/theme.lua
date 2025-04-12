return {
  {
    'f-person/auto-dark-mode.nvim',
    opts = true,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        show_end_of_buffer = true,
        integrations = {
          blink_cmp = true,
          diffview = true,
          fidget = true,
          harpoon = true,
          mason = true,
          neotest = true,
          snacks = {
            enabled = true,
          },
          which_key = true,
        },
      }
      vim.cmd 'colorscheme catppuccin'
    end,
  },
}
