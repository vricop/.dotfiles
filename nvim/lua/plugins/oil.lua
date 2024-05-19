return {
	"stevearc/oil.nvim",
	opts = {
		float = {
			max_width = 80,
			max_height = 10,
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<Leader>o",
      "<Cmd>Oil<Cr>",
			silent = true,
			desc = "Open parent dir",
		},
	},
}
