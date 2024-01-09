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
			"<Leader>-",
			function()
				require("oil").toggle_float()
			end,
			mode = "n",
			silent = true,
			desc = "Open parent dir (Oil)",
		},
	},
}
