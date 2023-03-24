return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		config = function()
      local actions = require "telescope.actions"
			require("telescope").setup({
				defaults = {
					selection_caret = " ",
					prompt_prefix = "   ",
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
					},
					mappings = {
            -- macOS special mappings: œ = <M-q>
						i = { ["œ"] = actions.smart_send_to_qflist + actions.open_qflist },
						n = { ["œ"] = actions.smart_send_to_qflist + actions.open_qflist },
					},
				},
				pickers = {
					live_grep = {
						prompt_prefix = " 󰑑 ",
					},
					grep_string = {
						prompt_prefix = "   ",
					},
					keymaps = {
						prompt_prefix = " 󰌌  ",
					},
					marks = {
						prompt_prefix = " 󰃀 ",
					},
					oldfiles = {
						prompt_title = "Recent files",
						prompt_prefix = "   ",
					},
					git_branches = {
						prompt_prefix = " 󰘬 ",
					},
					git_commits = {
						prompt_prefix = " 󰜘 ",
					},
				},
			})
			local map = vim.keymap.set
			map("n", "<Leader>ff", "<Cmd>Telescope find_files<Cr>", { desc = "Find Files" })
			map("n", "<Leader>fr", "<Cmd>Telescope oldfiles<Cr>", { desc = "Find Recent Files" })
			map("n", "<Leader>fk", "<Cmd>Telescope keymaps<Cr>", { desc = "Find Keymaps" })
			map("n", '<Leader>f"', "<Cmd>Telescope registers<Cr>", { desc = "Find Registers" })
			map("n", "<Leader>f`", "<Cmd>Telescope marks<Cr>", { desc = "Find Marks" })
			map("n", "<Leader>fw", "<Cmd>Telescope grep_string<Cr>", { desc = "Find Word Under Cursor" })
			map("n", "<Leader>ft", "<Cmd>Telescope live_grep<Cr>", { desc = "Find Text In Project" })
			map("n", "<Leader>fb", "<Cmd>Telescope buffers<Cr>", { desc = "Find buffers" })
			map("n", "<Leader>fgb", "<Cmd>Telescope git_branches<Cr>", { desc = "Find git branches" })
			map("n", "<Leader>fgc", "<Cmd>Telescope git_commits<Cr>", { desc = "Find git commits" })
		end,
	},
}
