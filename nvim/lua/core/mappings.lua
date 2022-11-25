local keymap = vim.keymap.set

-- Stop highlighting
keymap("", "<Leader>h", ":nohlsearch<cr>", { silent = true }) -- Stop highlighting
keymap("", "<C-s>", ":w<cr>", { silent = true })

-- Tab navigation
keymap("n", "<S-h>", "<Esc>:tabprevious<cr>")
keymap("n", "<S-l>", "<Esc>:tabnext<cr>")

-- Better window navigation
keymap("", "<C-h>", "<C-w>h")
keymap("", "<C-j>", "<C-w>j")
keymap("", "<C-k>", "<C-w>k")
keymap("", "<C-l>", "<C-w>l")

-- Netwr 
keymap("", "<Leader>e", ":Lexplore<cr>", { silent = true })

