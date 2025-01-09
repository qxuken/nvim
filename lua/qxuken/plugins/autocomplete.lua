return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = 'v0.*',
    build = 'cargo build --release',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        keys = {
          {
            '<C-L>',
            function()
              local ls = require 'luasnip'
              if ls.expand_or_locally_jumpable() then
                ls.expand_or_jump()
              end
            end,
            silent = true,
            mode = { 'i', 's' },
          },
          {
            '<C-K>',
            function()
              local ls = require 'luasnip'
              if ls.locally_jumpable(-1) then
                ls.jump(-1)
              end
            end,
            silent = true,
            mode = { 'i', 's' },
          },
        },
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'folke/lazydev.nvim',
    },
    opts = {
      snippets = {
        expand = function(snippet)
          require('luasnip').lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
        jump = function(direction)
          require('luasnip').jump(direction)
        end,
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
        providers = {
          lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink' },
        },
      },
    },
  },
}
