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
        NotifyERRORBody = { link = 'NormalFloat' },
        NotifyWARNBody = { link = 'NormalFloat' },
        NotifyINFOBody = { link = 'NormalFloat' },
        NotifyDEBUGBody = { link = 'NormalFloat' },
        NotifyTRACEBody = { link = 'NormalFloat' },
      },
    }

    vim.cmd 'colorscheme rose-pine'
  end,
}
