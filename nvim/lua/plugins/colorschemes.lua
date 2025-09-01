vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = 'catppuccin' },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
	{ src = "https://github.com/sainnhe/everforest" },
})

pcall(vim.cmd.colorscheme, "catppuccin-macchiato")
