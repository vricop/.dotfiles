return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		float = {
			max_width = 80,
			max_height = 10,
		},
	},
	keys = {
		{
			"<Leader>oo",
      "<Cmd>Oil<Cr>",
			silent = true,
			desc = "Open oil",
		},
	},
}
