return {
  {
    'LintaoAmons/scratch.nvim',
    event = 'VeryLazy',
    dependencies = {
      { 'ibhagwan/fzf-lua' },
      { 'nvim-telescope/telescope.nvim' },
    },
    keys = {
      { '<M-C-n>', '<cmd>Scratch<cr>', desc = 'Scratch' },
      { '<M-C-o>', '<cmd>ScratchOpen<cr>', desc = 'Scratch open' },
    },
    config = function()
      require('scratch').setup {
        scratch_file_dir = vim.fn.stdpath 'cache' .. '/scratch.nvim', -- where your scratch files will be put
        window_cmd = 'rightbelow edit', -- 'vsplit' | 'split' | 'edit' | 'tabedit' | 'rightbelow vsplit'
        use_telescope = true,
        -- fzf-lua is recommanded, since it will order the files by modification datetime desc. (require rg)
        file_picker = 'fzflua', -- "fzflua" | "telescope" | nil
        filetypes = { 'lua', 'js', 'sh', 'ts', 'go', 'rust' }, -- you can simply put filetype here
        filetype_details = { -- or, you can have more control here
          json = {}, -- empty table is fine
          ['yaml'] = {},
          go = {
            requireDir = true,
            filename = 'main.go',
            content = { 'package main', '', 'func main() {', '  ', '}' },
            cursor = {
              location = { 4, 2 },
              insert_mode = true,
            },
          },
          rust = {
            requireDir = true,
            filename = 'main.rs',
            content = { '', 'fn main() {', '  ', '}' },
            cursor = {
              location = { 3, 2 },
              insert_mode = true,
            },
          },
        },
        localKeys = {
          {
            filenameContains = { 'js', 'ts', 'rs', 'go' },
            LocalKeys = {
              {
                cmd = '<CMD>%SnipRun<CR>',
                key = '<M-C-f>',
                modes = { 'n', 'i', 'v' },
              },
            },
          },
          {
            filenameContains = { 'sh' },
            LocalKeys = {
              {
                cmd = '<CMD>RunShellCurrentLine<CR>',
                key = '<C-r>',
                modes = { 'n', 'i', 'v' },
              },
            },
          },
        },
      }
    end,
  },

  {
    'michaelb/sniprun',
    branch = 'master',
    build = 'sh install.sh',
    opts = {
      display = {
        'Terminal',
      },
    },
  },
}
