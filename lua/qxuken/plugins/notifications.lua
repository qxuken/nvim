return {
  {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    config = function()
      require('notify').setup { render = 'minimal', fps = 144 }
      vim.notify = require 'notify'
    end,
  },

  {
    'j-hui/fidget.nvim',
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
    },
  },

  -- {
  --   'folke/noice.nvim',
  --   event = 'VeryLazy',
  --   opts = {
  --     lsp = {
  --       override = {
  --         ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
  --         ['vim.lsp.util.stylize_markdown'] = true,
  --         ['cmp.entry.get_documentation'] = true,
  --       },
  --     },
  --     routes = {
  --       {
  --         filter = {
  --           event = 'notify',
  --           any = {
  --             { find = 'No information available' },
  --             { find = 'Neogit' },
  --           },
  --         },
  --         view = 'mini',
  --       },
  --       {
  --         filter = {
  --           event = 'msg_show',
  --           any = {
  --             { find = '%d+L, %d+B' },
  --             { find = '; after #%d+' },
  --             { find = '; before #%d+' },
  --             -- { find = '^:!' },
  --             { find = '%d+ lines yanked' },
  --             { find = '%d+ more lines' },
  --           },
  --         },
  --         view = 'mini',
  --       },
  --       {
  --         filter = { event = 'msg_show', kind = { 'search_count', 'echo' } },
  --         view = 'mini',
  --       },
  --       -- {
  --       --   filter = { event = 'msg_show', kind = 'search_count' },
  --       --   view = 'mini',
  --       -- },
  --     },
  --     presets = {
  --       bottom_search = true, -- use a classic bottom cmdline for search
  --       command_palette = true, -- position the cmdline and popupmenu together
  --       long_message_to_split = true, -- long messages will be sent to a split
  --       inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --       lsp_doc_border = true, -- add a border to hover docs and signature help
  --     },
  --   },
  --   dependencies = {
  --     'MunifTanjim/nui.nvim',
  --     'rcarriga/nvim-notify',
  --   },
  -- },
}
