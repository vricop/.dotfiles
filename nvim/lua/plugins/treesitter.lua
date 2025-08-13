-- TODO: Config vitels

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"markdown",
		"dot",
		"bash",
		"html",
		"javascript",
		"typescript",
    -- "vitels",
		"tsx",
		"vue",
		"svelte",
		"css",
		"lua",
	},
	highlight = { enable = true },
})
