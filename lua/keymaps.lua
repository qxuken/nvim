local set = vim.keymap.set

set('n', '<leader>bd', '<cmd>bd<CR>', { desc = '[Q]uit [B]uffer' })
set('n', '<leader>bo', function()
  local current_buf = vim.fn.bufnr()
  local current_win = vim.fn.win_getid()
  local bufs = vim.fn.getbufinfo { buflisted = 1 }
  for _, buf in ipairs(bufs) do
    if buf.bufnr ~= current_buf then
      vim.cmd('silent! bdelete ' .. buf.bufnr)
    end
  end
  vim.fn.win_gotoid(current_win)
end, { silent = true, desc = 'Close all [O]ther [B]uffers except current one.' })

-- Keybinds to make split navigation easier.
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Quickfix keymaps
set('n', '[q', '<cmd>cprev<CR>', { desc = 'Go to prev [Q]uickfix item' })
set('n', ']q', '<cmd>cnext<CR>', { desc = 'Go to next [Q]uickfix item' })

-- Buffer keymaps
set('n', '[b', '<cmd>bprevious<CR>', { desc = 'Go to prev [B]uffer' })
set('n', ']b', '<cmd>bnext<CR>', { desc = 'Go to next [B]uffer' })

-- Convinient save
set('i', '<C-s>', '<Esc><cmd>w<CR>')
set('n', '<C-s>', '<cmd>w<CR>')

-- Goto keymaps
set({ 'n', 'v' }, 'gh', '^', { desc = '[G]o to start of the line' })
set({ 'n', 'v' }, 'gl', '$', { desc = '[G]o to end of the line' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
