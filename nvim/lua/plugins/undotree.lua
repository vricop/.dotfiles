return {
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<Leader>u", vim.cmd.UndotreeToggle)
			vim.g.undotree_WindowLayout = 4
		end,
	},
}
