vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })
local lualine = require("lualine")

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin-macchiato",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{
				"mode",
				right_padding = 0,
				fmt = function(str)
					return str:sub(1, 3)
				end,
			},
		},
		lualine_b = {
			{
				"branch",
				right_padding = 0,
				icon = {
					" ",
					align = "right",
				},
			},
		},
		lualine_c = {
			{
				"filename",
				file_status = false,
				symbols = {
					unnamed = "",
					newfile = ""
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
		lualine_x = {
			{
				"location",
				padding = { left = 0 },
			},
			{ "progress" },
			{
				"selectioncount",
				left_padding = 0,
			},
			{
				"diagnostics",
				left_padding = 0,
			},
		},
		lualine_y = {
			{
				"filetype",
        colored = true,
				left_padding = 0,
			},
		},
		lualine_z = {
			{
				"datetime",
				left_padding = 0,
				style = "%H:%M",
				icon = "󱑎 ",
			},
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
