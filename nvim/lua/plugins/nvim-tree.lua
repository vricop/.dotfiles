return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    config = function()
      local keymap = require 'core.utils'.keymap
      require('nvim-tree').setup({
        hijack_directories = {
          auto_open = false,
        },
        on_attach = function(bufnr)
          local api = require 'nvim-tree.api'
          local function opts(desc)
            return {
              desc = desc,
              buffer = bufnr,
              nowait = true,
            }
          end
          api.config.mappings.default_on_attach(bufnr)
          -- Match LSP diagnostics mappings
          keymap('n', ']d', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
          keymap('n', '[d', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
          keymap('n', 'l', api.node.open.edit, opts('Open'))
          keymap('n', 'h', api.node.navigate.parent_close, opts('Close'))
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
      })

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
    end
  },
}
