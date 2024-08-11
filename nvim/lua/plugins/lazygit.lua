return {
	{
		"kdheepak/lazygit.nvim",
    enabled = enable_plugins.lazygit,
		init = function()
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
