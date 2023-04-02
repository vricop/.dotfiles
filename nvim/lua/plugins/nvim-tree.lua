return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
		config = function()
      require('nvim-tree').setup({
        on_attach = function(bufnr)
          local api = require 'nvim-tree.api'
          local map = vim.keymap.set
          local function opts(desc)
            return {
              desc = desc,
              buffer = bufnr,
              noremap = true,
              silent = true,
              nowait = true,
            }
          end
          api.config.mappings.default_on_attach(bufnr)
          -- Match LSP diagnostics mappings
          map('n', ']d', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
          map('n', '[d', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
          map('n', 'l', api.node.open.edit, opts('Open'))
          map('n', 'h', api.node.navigate.parent_close, opts('Close'))
        end,
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
      })

			vim.keymap.set('n', '<Leader>e', ':NvimTreeFindFileToggle<Cr>', {
				desc = 'Toggle explorer',
				silent = true,
			})
		end,
	},
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-tree.lua' },
    },
    config = function ()
      require('lsp-file-operations').setup()
    end
  },
}
