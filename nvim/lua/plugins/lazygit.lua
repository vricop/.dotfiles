return {
	{
		"kdheepak/lazygit.nvim",
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 1
		end,
		keys = {
			{
				"<Leader>gg",
				":LazyGit<Cr>",
				noremap = true,
				desc = "Open Lazygit",
				silent = true,
			},
		},
	},
}
