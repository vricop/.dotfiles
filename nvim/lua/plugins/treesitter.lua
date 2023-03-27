return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
      require 'nvim-treesitter.configs'.setup {
				ensure_installed = {
					'javascript',
					'typescript',
					'tsx',
					'css',
					'html',
					'lua',
					'rust',
				},
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
          config = {
            -- Languages that have a single comment style
            typescript = "// %s",
            css = "/* %s */",
            scss = "/* %s */",
            html = "<!-- %s -->",
            svelte = "<!-- %s -->",
            vue = "<!-- %s -->",
            json = "",
          },
				},
        -- Improves indent formatting for the `=` command
        indent = {
          enable = true
        }
			}
		end,
	},
}
