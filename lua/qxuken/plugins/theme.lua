return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        transparent_background = true,
        term_colors = true,
        integrations = {
          cmp = true,
          dap = true,
          gitsigns = true,
          nvimtree = true,
          native_lsp = {
            enabled = true,
          },
          mason = true,
          which_key = true,
          notify = true,
          treesitter = true,
          treesitter_context = true,
          mini = {
            enabled = true,
          },
          telescope = {
            enabled = true,
          },
          neotest = true,
        },
      }

      vim.cmd.colorscheme 'catppuccin'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
