return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
    ---@type false | "classic" | "modern" | "helix"
    preset = 'helix'
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
