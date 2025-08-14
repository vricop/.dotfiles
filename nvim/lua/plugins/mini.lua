vim.pack.add({
	"https://github.com/echasnovski/mini.icons",
	"https://github.com/echasnovski/mini.files",
	"https://github.com/echasnovski/mini.pick",
	"https://github.com/echasnovski/mini.hipatterns",
	"https://github.com/echasnovski/mini.pairs",
})

require("mini.icons").setup()
require("mini.files").setup()
require("mini.pairs").setup()

---@diagnostic disable-next-line: undefined-global
MiniIcons.mock_nvim_web_devicons()

local map = vim.keymap.set

map("n", "<Leader>e", function()
	local buf = vim.api.nvim_buf_get_name(0)
	local path = vim.fn.fnamemodify(buf, ":h")

	---@diagnostic disable-next-line: undefined-global
	if not MiniFiles.close() then
		---@diagnostic disable-next-line: undefined-global
		MiniFiles.open(path)
	end
end, { desc = "File explorer" })

require("mini.pick").setup({
	window = { config = {
		height = 15,
	}, prompt_prefix = "   " },
})


map("n", "<Leader><space>", ":Pick files<Cr>", { desc = "Pick files", silent = true })
map("n", "<Leader>,", ":Pick buffers<Cr>", { desc = "Pick files", silent = true })
map("n", "<Leader>/", ":Pick grep_live<Cr>", { desc = "Find (grep)", silent = true })

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
