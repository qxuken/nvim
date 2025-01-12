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
      highlight_groups = {
        LspReferenceText = { fg = 'text', bg = 'leaf', blend = 20, inherit = false },
        LspReferenceRead = { fg = 'base', bg = 'leaf', inherit = false },
        LspReferenceWrite = { fg = 'text', bg = 'leaf', blend = 20, inherit = false },
      },
    }

    vim.cmd 'colorscheme rose-pine'
  end,
}
