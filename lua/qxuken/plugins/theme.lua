return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nightfox').setup {
        transparent = true,
        palettes = {
          all = {
            bg1 = 'NONE',
          },
        },
      }

      vim.cmd 'colorscheme nightfox'
    end,
  },
  -- {
  --   'rmehri01/onenord.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('onenord').setup {
  --       theme = 'dark',
  --       borders = true,
  --       disable = {
  --         background = false,
  --       },
  --     }
  --
  --     vim.cmd.colorscheme 'onenord'
  --   end,
  -- },
  -- {
  --   'scottmckendry/cyberdream.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('cyberdream').setup {
  --       transparent = true,
  --       borderless_telescope = true,
  --     }
  --
  --     vim.cmd.colorscheme 'cyberdream'
  --   end,
  -- },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  --   config = function()
  --     require('catppuccin').setup {
  --       flavour = 'mocha',
  --       transparent_background = true,
  --       -- term_colors = true,
  --       integrations = {
  --         cmp = true,
  --         dap = true,
  --         gitsigns = true,
  --         -- nvimtree = true,
  --         native_lsp = {
  --           enabled = true,
  --         },
  --         mason = true,
  --         which_key = true,
  --         notify = true,
  --         treesitter = true,
  --         treesitter_context = true,
  --         mini = {
  --           enabled = true,
  --         },
  --         telescope = {
  --           enabled = true,
  --         },
  --         neotest = true,
  --       },
  --       color_overrides = {
  --         all = {
  --           rosewater = '#f0e2df',
  --           flamingo = '#ebd0d0',
  --           pink = '#759c9f',
  --           mauve = '#c5a9a8',
  --           red = '#c4a7ad',
  --           maroon = '#cfaeb3',
  --           peach = '#dac291',
  --           yellow = '#d884c2',
  --           green = '#75b2cf',
  --           teal = '#94e2d5',
  --           sky = '#a5d7e0',
  --           sapphire = '#74c7ec',
  --           blue = '#b770d2',
  --           lavender = '#b4befe',
  --           text = '#cfd6ed',
  --           subtext1 = '#bbc2dc',
  --           subtext0 = '#a6adc8',
  --           overlay2 = '#9399b2',
  --           overlay1 = '#7f849c',
  --           overlay0 = '#76635c',
  --           surface2 = '#585b70',
  --           surface1 = '#45475a',
  --           surface0 = '#313244',
  --           base = '#040b0d',
  --           mantle = '#181921',
  --           crust = '#111118',
  --         },
  --       },
  --     }
  --
  --     vim.cmd.colorscheme 'catppuccin'
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
}
