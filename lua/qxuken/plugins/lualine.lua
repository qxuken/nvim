-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.white, bg = 'transparent' },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  -- insert = { a = { fg = colors.black, bg = colors.blue } },
  -- visual = { a = { fg = colors.black, bg = colors.cyan } },
  -- replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = 'transparent' },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = bubbles_theme,
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            {
              function()
                return ''
              end,
              color = function()
                local mode = vim.api.nvim_get_mode()['mode']
                if mode == 'i' or mode == 'R' then
                  return { fg = colors.blue }
                elseif mode == 'v' or mode == 'V' or mode == '^V' then
                  return { fg = colors.cyan }
                elseif mode == 'c' then
                  return { fg = colors.red }
                else
                  return { fg = colors.violet }
                end
              end,

              padding = { left = 0, right = 0 },
            },
            {
              'mode',
              fmt = function(str)
                if string.sub(str, 1, 2) == 'V-' then
                  return str
                end
                return ' ' .. str:sub(1, 1)
              end,
              color = function()
                local mode = vim.api.nvim_get_mode()['mode']
                if mode == 'i' or mode == 'R' then
                  return { bg = colors.blue, fg = colors.black, gui = 'bold' }
                elseif mode == 'v' or mode == 'V' or mode == '^V' then
                  return { bg = colors.cyan, fg = colors.black, gui = 'bold' }
                elseif mode == 'c' then
                  return { bg = colors.red, fg = colors.black, gui = 'bold' }
                else
                  return { bg = colors.violet, fg = colors.black, gui = 'bold' }
                end
              end,
              padding = { left = 0, right = 1 },
            },
          },
          lualine_b = {
            {
              'filename',
              path = 1,
              shorting_target = 60,
            },
            {
              function()
                return ''
              end,
              color = { bg = 'transparent', fg = colors.grey },

              padding = { left = 0, right = 1 },
            },
          },
          lualine_c = {
            '%=', --[[ add your center compoentnts here in place of this comment ]]
          },
          lualine_x = {
            --   {
            --     require('noice').api.status.mode.get,
            --     cond = require('noice').api.status.mode.has,
            --     color = { fg = '#ff9e64' },
            --   },
            --   {
            --     require('noice').api.status.search.get,
            --     cond = require('noice').api.status.search.has,
            --     color = { fg = colors.cyan },
            --   },
          },
          lualine_y = {
            {
              function()
                return ''
              end,
              color = { bg = 'transparent', fg = colors.grey },

              padding = { left = 1, right = 0 },
            },
            'filetype',
            'progress',
            'selectioncount',
          },
          lualine_z = {
            {
              'location',
              fmt = function(s)
                return s .. ' '
              end,
              color = { bg = colors.violet, fg = colors.black },
              padding = { left = 1, right = 0 },
            },
            {
              function()
                return ''
              end,
              color = { fg = colors.violet },

              padding = { left = 0, right = 0 },
            },
          },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
        tabline = {},
        extensions = { 'quickfix', 'oil', 'nvim-dap-ui', 'lazy', 'mason', 'fzf' },
      }
    end,
  },
}
