return {
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = { { 'nvim-tree/nvim-web-devicons' } },
		config = function()
      require('nvim-tree').setup {
        on_attatch = function(bufnr)
          local api = require 'nvim-tree.api'
          local map = vim.keymap.set
          local function opts(desc)
            return {
              desc = 'Nvim-tree: ' .. desc,
              buffer = bufnr,
              noremap = true,
              silent = true,
              nowait = true,
            }
          end
          -- Match LSP diagnostics mappings
          map('n', ']d', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
          map('n', '[d', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
        end,
        view = {
          mappings = {
            custom_only = false,
            list = {
              -- TODO: Move to `on_attatch` field. Check LuanarVim nvim mappings
              { key = { 'l', '<CR>', 'o' }, action = 'edit', mode = 'n' },
              { key = 'h', action = 'close_node' },
              { key = 'v', action = 'vsplit' },
              { key = 'C', action = 'cd' },
            },
          },
        },
        renderer = {
          root_folder_label = ':t',
          highlight_git = true,
          icons = {
            git_placement = 'after',
            padding = ' ',
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
              bookmark = '',
              modified = '●',
              folder = {
                arrow_closed = '',
                arrow_open = '',
                default = '󰉋',
                open = '󰝰',
                empty = '󰉖',
                empty_open = 'ﱮ',
                symlink = '󱧱',
                symlink_open = 'ﱮ',
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

			vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<Cr>', {
				desc = 'Toggle explorer',
				silent = true,
			})
		end,
	},
}
