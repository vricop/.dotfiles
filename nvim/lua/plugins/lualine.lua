vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })
local lualine = require("lualine")

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin-macchiato",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			"mode",
		},
		lualine_b = {
			{ "branch", icon = "󰘬" },
		},
		lualine_c = {
			{
				"filename",
				symbols = {
					unnamed = "󰦨",
				},
			},
			{
				"diff",
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
			},
		},
		lualine_x = {},
		lualine_y = {
			"diagnostics",
			"filetype",
		},
		lualine_z = {
			"selectioncount",
			"searchcount",
			"location",
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
