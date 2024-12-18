return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup {
      styles = {
        italic = false,
        bold = true,
        transparency = false,
      },
    }
    vim.cmd 'colorscheme rose-pine'
  end,
}
