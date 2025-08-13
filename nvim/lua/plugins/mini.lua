vim.pack.add({
	"https://github.com/echasnovski/mini.icons",
	"https://github.com/echasnovski/mini.files",
	"https://github.com/echasnovski/mini.pick",
	"https://github.com/echasnovski/mini.hipatterns",
})

require("mini.icons").setup()
require("mini.files").setup()

require("mini.pick").setup({
	window = { config = {
		height = 15,
	}, prompt_prefix = "   " },
})

local map = vim.keymap.set

map("n", "<Leader><space>", ":Pick files<Cr>", { desc = "Pick files", silent = true })
map("n", "<Leader>ff", ":Pick files<Cr>", { desc = "Pick files", silent = true })
map("n", "<Leader>fb", ":Pick buffers<Cr>", { desc = "Pick files", silent = true })
map("n", "<Leader>/", ":Pick grep_live<Cr>", { desc = "Find (grep)", silent = true })
map("n", "<Leader>e", function()
	local buf = vim.api.nvim_buf_get_name(0)
	local path = vim.fn.fnamemodify(buf, ":h")

	---@diagnostic disable-next-line: undefined-global
	if not MiniFiles.close() then
		---@diagnostic disable-next-line: undefined-global
		MiniFiles.open(path)
	end
end, { desc = "File explorer" })

local hipatterns = require("mini.hipatterns")

hipatterns.setup({
	highlighters = {
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
