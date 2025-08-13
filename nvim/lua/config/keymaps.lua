-- Custom variable to toggle a diff mode in all split windows.
-- See `mappings.lua`
_G.is_diff_mode_on = false

if vim.fn.has("mac") then
	-- macOS users will use these characters
	_G.Meta = {
		j = "∆",
		k = "˚",
		h = "˙",
		l = "¬",
		J = "Ô",
		K = "",
		q = "œ",
	}
else
	-- Non macOS users will use these
	_G.Meta = {
		j = "<M-j>",
		k = "<M-k>",
		h = "<M-h>",
		l = "<M-l>",
		J = "<M-j>",
		K = "<M-k>",
		q = "<M-q>",
	}
end

local map = vim.keymap.set

map("n", "<Esc>", ":noh<cr>", { desc = "Stop highlighting", noremap = true, silent = true })
map("n", "<Leader>w", ":up<Cr>", { desc = "Write buffer", silent = true })
map("n", "<Leader>wa", ":wa<Cr>", { desc = "Write all buffers", silent = true })
map("n", "<Leader>d", ":bd<Cr>", { desc = "Delete buffer", silent = true })
map("n", "<Leader>D", "<cmd>bufdo bd<cr>", { desc = "Delete all buffers", silent = true })
map("n", "<Leader>V", ":e $MYVIMRC<Cr>", { desc = "Edit config", silent = true })

map("n", "<Leader>do", function()
	local current_buf = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()

	for _, buf in ipairs(buffers) do
		if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end, {
	desc = "Delete other buffers",
	silent = true,
})

map("n", "<Leader>q", ":qa<Cr>", { desc = "Quit Neovim", silent = true })
map("n", "<Leader>c", ":close<Cr>", { desc = "Close window", silent = true })
map("n", "J", "mzJ`z", { desc = "Join lines and center screen" })
map("n", "<Tab>", ">>", { desc = "Indent" })
map("n", "<S-Tab>", "<<", { desc = "Unindent" })
map("v", "<Tab>", ">gv", { desc = "Indent" })
map("v", "<S-Tab>", "<gv", { desc = "Unindent" })
map("n", Meta.h, "<C-w>>", { desc = "Increase vertical split" })
map("n", Meta.l, "<C-w><", { desc = "Decrease vertical split" })
map("n", "H", ":bp<Cr>", { desc = "Previous buffer", silent = true })
map("n", "L", ":bn<Cr>", { desc = "Next buffer", silent = true })
map("v", Meta.j, ":m '>+1<Cr>gv=gv", { desc = "Move line down", silent = true })
map("n", Meta.j, ":m .+1<Cr>==", { desc = "Move line down", silent = true })
map("v", Meta.k, ":m '<-2<Cr>gv=gv", { desc = "Move line up", silent = true })
map("n", Meta.k, ":m .-2<Cr>==", { desc = "Move line up", silent = true })
map("n", Meta.J, ":t+0<Cr>", { desc = "Duplicate line below", silent = true })
map("v", Meta.J, ":t'>+0<Cr>", { desc = "Duplicate line below", silent = true })
map("n", Meta.K, ":t-1<Cr>", { desc = "Duplicate line above", silent = true })
map("v", Meta.K, ":t'<-1<Cr>", { desc = "Duplicate line above", silent = true })
map("v", ">", ">gv", { desc = "Indent selection right", noremap = true })
map("v", "<", "<gv", { desc = "Indent selection left", noremap = true })
map("n", "n", "nzz", { desc = "Next occurrency & center" })
map("n", "N", "Nzz", { desc = "Previous occurrency & center" })
map("n", "*", "*zz", { desc = "Next occurrency & center" })
map("n", "#", "#zz", { desc = "Previous occurrency & center" })
map("n", "g*", "g*zz", { desc = "Next occurrency & center" })
map("n", "g#", "g#zz", { desc = "Previous occurrency & center" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move screen up & center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move screen down & center" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to window top" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window down" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to window right" })
map("n", "<C-c>", "<C-w><C-w>", { desc = "Cycle windows" })
map("n", "<Leader>fk", ":map<Cr>", { desc = "Find keymaps", silent = true })
map("n", "<Leader>fr", ":registers<Cr>", { desc = "Find registers", silent = true })
map("n", "<Leader>fm", ":marks<Cr>", { desc = "Find marks", silent = true })
map({ "n", "v" }, "gh", "^", { desc = "Go to the first non blank character" })
map({ "n", "v" }, "gl", "g_", { desc = "Go to the last non blank character" })
map("n", "<Leader>v", "<C-w>v", { desc = "Split vertically" })
map("n", "<Leader>h", "<C-w>s", { desc = "Split horizontally" })
map("n", "]q", ":cn<Cr>", { desc = "Next item in quickfix list", silent = true })
map("n", "[q", ":cp<Cr>", { desc = "Previous item in quickfix list", silent = true })
map("x", "p", [["_dP"]])
map("i", "jj", "<Esc>")
map("n", "Q", "@q", { desc = 'Run macro on regiser "q' })
map("n", "<Leader>ff", ":find<Space>**/", { desc = "Find files", silent = false })
map("n", "<Leader>e", ":Lexplore<Cr>", { desc = "Toggle netwr", silent = true })

map("n", "<Leader>ti", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end, {
	desc = "Toggle inlay hint",
	silent = true,
})

map("n", "<Leader>tr", function()
	vim.o.relativenumber = not vim.o.relativenumber
end, {
	desc = "Toggle relative numbers",
	silent = true,
})

map("n", "<Leader>tc", function()
	vim.o.conceallevel = vim.o.conceallevel == 0 and 2 or 0
end, {
	desc = "Toggle conceal",
})

map("n", "<Leader>tl", function()
	vim.o.lazyredraw = not vim.o.lazyredraw
end, {
	desc = "Toggle lazyredraw",
})

map("n", "<Leader>td", function()
	if is_diff_mode_on then
		vim.cmd("windo diffoff")
	else
		vim.cmd("windo diffthis")
	end
	_G.is_diff_mode_on = not is_diff_mode_on
end, {
	silent = true,
	desc = "Toggle diff in splits",
})

map("n", "<Leader>ol", ":Lazy", { silent = true, desc = "Open Lazy" })
map("n", "<Leader>r", ":update<Cr> :source<Cr>", { silent = true, desc = "Reload config" })
