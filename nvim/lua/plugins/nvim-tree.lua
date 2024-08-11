return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    enabled = enable_plugins['nvim-tree'],
    config = function()
      local keymap = vim.keymap.set

      require('nvim-tree').setup {
        hijack_directories = {
          auto_open = false,
        },
        on_attach = function(bufnr)
          local api = require 'nvim-tree.api'

          api.config.mappings.default_on_attach(bufnr)
          -- Match LSP diagnostics mappings

          keymap('n', ']d', api.node.navigate.diagnostics.next, {
            desc = 'Next Diagnostic',
            nowait = true,
            noremap = true
          })

          keymap('n', '[d', api.node.navigate.diagnostics.prev, {
            desc = 'Prev Diagnostic',
            nowait = true,
            noremap = true
          })

          keymap('n', 'l', api.node.open.edit, {
            desc = 'Open',
            nowait = true,
            noremap = true
          })

          keymap('n', 'h', api.node.navigate.parent_close, {
            desc = 'Close',
            nowait = true,
            noremap = true
          })
        end,
        renderer = {
          root_folder_label = ':t',
          highlight_git = true,
          indent_width = 2,
          indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
              corner = '└',
              edge = '│',
              item = '│',
              bottom = '─',
              none = ' ',
            },
          },
          icons = {
            git_placement = 'after',
            padding = '  ',
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
              modified = true,
            },
            glyphs = {
              default = '',
              symlink = '',
              bookmark = ' ',
              modified = '●',
              folder = {
                arrow_closed = '',
                arrow_open = '',
                default = '󰉋',
                open = '󰝰',
                empty = '󰉖',
                empty_open = '󰷏 ',
                symlink = '󱧱',
                symlink_open = '󰷏 ',
              },
              git = {
                unstaged = '●',
                staged = '',
                unmerged = '',
                renamed = 'R',
                untracked = 'U',
                deleted = 'D',
                ignored = ' ',
              },
            },
          },
          special_files = {
            'Cargo.toml',
            'Makefile',
            'README.md',
            'readme.md',
            'Dockerfile',
          },
        },
        live_filter = {
          prefix = '󰈶 FILTER : ',
        },
      }

      keymap('n', '<Leader>e', ':NvimTreeFindFileToggle<Cr>', {
        desc = 'Toggle explorer',
      })

      vim.g.nvim_tree_auto_open = 0
    end,
  },
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-tree.lua' },
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
  },
}
