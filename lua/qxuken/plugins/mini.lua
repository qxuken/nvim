return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - Visually select Around )paren
      --  - yinq - Yank Inside Next 'quote
      --  - ci'  - Change Inside 'quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - Surround Add Inner Word )Paren
      -- - sd'   - Surround Delete 'quotes
      -- - sr)'  - Surround Replace ) '
      require('mini.surround').setup()

      require('mini.align').setup()

      require('mini.pairs').setup()

      require('mini.jump').setup()

      require('mini.move').setup()

      -- local statusline = require 'mini.statusline'
      -- statusline.setup { use_icons = vim.g.have_nerd_font }
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return '%2l:%-2v'
      -- end
    end,
  },
}
