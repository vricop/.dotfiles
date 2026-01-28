return {
	"mason-org/mason-lspconfig.nvim",
	lazy = false,
	opts = {
		ensure_installed = {
			"lua_ls",
			"pyright",
			"emmet_ls",
			"vtsls",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	keys = {
		{
			"<leader>m",
			":Mason<Cr>",
			desc = "Mason",
		},
	},
}
