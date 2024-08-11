return {
	"stevearc/oil.nvim",
  enabled = enable_plugins.oil,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		float = {
			max_width = 80,
			max_height = 10,
		},
	},
	keys = {
		{
			"<Leader>o",
      "<Cmd>Oil<Cr>",
			silent = true,
			desc = "Open parent dir",
		},
	},
}
