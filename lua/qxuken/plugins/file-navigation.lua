return {
  -- A File Explorer For Neovim
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    keys = {
      { '<C-t>', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
      { '<leader>tt', '<cmd>NvimTreeToggle<CR>', desc = 'NvimTree Toggle' },
      { '<leader>tf', '<cmd>NvimTreeFindFile<CR>', desc = 'NvimTree FindFile' },
    },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        view = {
          width = 50,
        },
      }
      vim.api.nvim_create_autocmd('QuitPre', {
        callback = function()
          local invalid_win = {}
          local wins = vim.api.nvim_list_wins()
          for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match 'NvimTree_' ~= nil then
              table.insert(invalid_win, w)
            end
          end
          if #invalid_win == #wins - 1 then
            -- Should quit, so we close all invalid windows.
            for _, w in ipairs(invalid_win) do
              vim.api.nvim_win_close(w, true)
            end
          end
        end,
      })
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    },
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  },
}
