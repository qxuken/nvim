return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    keys = {
      {
        '<leader>bd',
        function()
          Snacks.bufdelete.delete()
        end,
        desc = 'Buffer delete',
      },
      {
        '<leader>bo',
        function()
          Snacks.bufdelete.other()
        end,
        desc = 'Buffers delete Other',
      },
      {
        '<leader>bO',
        function()
          Snacks.bufdelete.other { force = true }
        end,
        desc = 'Buffers delete Other(Force)',
      },
      {
        '<leader>R',
        function()
          Snacks.rename.rename_file()
        end,
        desc = 'Rename File',
      },
    },
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      bufdelete = { enabled = true },
      dim = { enabled = true },
      scope = { enabled = true },
      toggle = { enabled = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          Snacks.toggle.dim():map '<leader>dd'
          Snacks.toggle.inlay_hints():map '<leader>cI'
        end,
      })
    end,
  },
}
