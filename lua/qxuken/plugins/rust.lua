return {
  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      require('crates').setup()

      vim.api.nvim_create_autocmd('BufRead', {
        group = vim.api.nvim_create_augroup('CmpSourceCargo', { clear = true }),
        pattern = 'Cargo.toml',
        callback = function(event)
          local cmp = require 'cmp'
          cmp.setup.buffer { sources = { { name = 'crates', buffer = event.buf } } }

          require('which-key').register {
            ['<leader>cr'] = { name = '[C]rate', _ = 'which_key_ignore' },
          }

          local crates = require 'crates'
          local with_desc = function(desc)
            return { silent = true, desc = desc, buffer = event.buf }
          end
          vim.keymap.set('n', '<leader>crt', crates.toggle, with_desc 'toggle')
          vim.keymap.set('n', '<leader>crr', crates.reload, with_desc 'reload')

          vim.keymap.set('n', '<leader>crv', crates.show_versions_popup, with_desc 'show_versions_popup')
          vim.keymap.set('n', '<leader>crf', crates.show_features_popup, with_desc 'show_features_popup')
          vim.keymap.set('n', '<leader>crd', crates.show_dependencies_popup, with_desc 'show_dependencies_popup')

          vim.keymap.set('n', '<leader>cru', crates.update_crate, with_desc 'update_crate')
          vim.keymap.set('v', '<leader>cru', crates.update_crates, with_desc 'update_crates')
          vim.keymap.set('n', '<leader>cra', crates.update_all_crates, with_desc 'update_all_crates')
          vim.keymap.set('n', '<leader>crU', crates.upgrade_crate, with_desc 'upgrade_crate')
          vim.keymap.set('v', '<leader>crU', crates.upgrade_crates, with_desc 'upgrade_crates')
          vim.keymap.set('n', '<leader>crA', crates.upgrade_all_crates, with_desc 'upgrade_all_crates')

          vim.keymap.set('n', '<leader>crx', crates.expand_plain_crate_to_inline_table, with_desc 'expand_plain_crate_to_inline_table')
          vim.keymap.set('n', '<leader>crX', crates.extract_crate_into_table, with_desc 'extract_crate_into_table')

          vim.keymap.set('n', '<leader>crH', crates.open_homepage, with_desc 'open_homepage')
          vim.keymap.set('n', '<leader>crR', crates.open_repository, with_desc 'open_repository')
          vim.keymap.set('n', '<leader>crD', crates.open_documentation, with_desc 'open_documentation')
          vim.keymap.set('n', '<leader>crC', crates.open_crates_io, with_desc 'open_crates_io')
        end,
      })
    end,
  },
}
