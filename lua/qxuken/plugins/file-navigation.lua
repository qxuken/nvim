return {
  {
    'stevearc/oil.nvim',
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    },
    config = function()
      -- helper function to parse output
      local function parse_output(proc)
        local result = proc:wait()
        local ret = {}
        if result.code == 0 then
          for line in vim.gsplit(result.stdout, '\n', { plain = true, trimempty = true }) do
            -- Remove trailing slash
            line = line:gsub('/$', '')
            ret[line] = true
          end
        end
        return ret
      end

      -- build git status cache
      local function new_git_status()
        return setmetatable({}, {
          __index = function(self, key)
            local ignore_proc = vim.system({ 'git', 'ls-files', '--ignored', '--exclude-standard', '--others', '--directory' }, {
              cwd = key,
              text = true,
            })
            local tracked_proc = vim.system({ 'git', 'ls-tree', 'HEAD', '--name-only' }, {
              cwd = key,
              text = true,
            })
            local ret = {
              ignored = parse_output(ignore_proc),
              tracked = parse_output(tracked_proc),
            }

            rawset(self, key, ret)
            return ret
          end,
        })
      end
      local git_status = new_git_status()

      -- Clear git status cache on refresh
      local refresh = require('oil.actions').refresh
      local orig_refresh = refresh.callback
      refresh.callback = function(...)
        git_status = new_git_status()
        orig_refresh(...)
      end

      require('oil').setup {
        columns = {
          'icon',
          -- 'permissions',
          -- 'size',
          -- 'mtime',
        },
        view_options = {
          -- show_hidden = true,
          is_hidden_file = function(name, bufnr)
            local dir = require('oil').get_current_dir(bufnr)
            local is_dotfile = vim.startswith(name, '.') and name ~= '..'
            -- if no local directory (e.g. for ssh connections), just hide dotfiles
            if not dir then
              return is_dotfile
            end
            -- dotfiles are considered hidden unless tracked
            if is_dotfile then
              return not git_status[dir].tracked[name]
            else
              -- Check if file is gitignored
              return git_status[dir].ignored[name]
            end
          end,
        },
        win_options = {
          cursorcolumn = false,
        },
        float = {
          -- padding = 1,
          border = 'rounded',
          win_options = {
            -- winblend = 1,
          },
        },
        keymaps = {
          ['gd'] = {
            desc = 'Toggle file detail view',
            callback = function()
              detail = not detail
              if detail then
                require('oil').set_columns { 'icon', 'permissions', 'size', 'mtime' }
              else
                require('oil').set_columns { 'icon' }
              end
            end,
          },
        },
      }
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    keys = {
      {
        '<leader>ea',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Add buffer to harpoon',
      },
      {
        '<leader>ed',
        function()
          require('harpoon'):list():remove()
        end,
        desc = 'Remove buffer from harpoon',
      },
      {
        '<leader>ee',
        function()
          local h = require 'harpoon'
          h.ui:toggle_quick_menu(h:list())
        end,
        desc = 'Open harpoon ui',
      },
      {
        '<M-1>',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'Select 1st harpoon item',
      },
      {
        '<leader>e1',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'Select 1st harpoon item',
      },
      {
        '<M-2>',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'Select 2nd harpoon item',
      },
      {
        '<leader>e2',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'Select 2nd harpoon item',
      },
      {
        '<M-3>',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'Select 3rd harpoon item',
      },
      {
        '<leader>e3',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'Select 3rd harpoon item',
      },
      {
        '<M-4>',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'Select 4th harpoon item',
      },
      {
        '<leader>e4',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'Select 4th harpoon item',
      },
      {
        '<M-5>',
        function()
          require('harpoon'):list():select(5)
        end,
        desc = 'Select 5th harpoon item',
      },
      {
        '<leader>e5',
        function()
          require('harpoon'):list():select(5)
        end,
        desc = 'Select 5th harpoon item',
      },
      {
        '[e',
        function()
          require('harpoon'):list():prev { ui_nav_wrap = true }
        end,
        desc = 'Go to prev harpoon',
      },
      {
        ']e',
        function()
          require('harpoon'):list():next { ui_nav_wrap = true }
        end,
        desc = 'Go to next harpoon',
      },
    },
    config = true,
  },
  {
    'chentoast/marks.nvim',
    event = 'VeryLazy',
    opts = {},
  },
}
