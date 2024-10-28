return {
  {
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'goimports', 'gofmt' },
        javascript = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier' },
        templ = { 'templ' },
      },
    },
  },

  {
    'windwp/nvim-ts-autotag',
    opts = {
      aliases = {
        ['templ'] = 'html',
      },
    },
  },
}
