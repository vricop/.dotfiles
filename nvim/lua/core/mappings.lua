local keymap = vim.keymap.set
-- Stop highlighting
keymap("n", "<Leader>h", ":nohlsearch<cr>", { silent = true }) -- Stop highlighting
keymap("n", "<C-s>", ":w<cr>", { silent = true }) -- Save file

-- Tab navigation
keymap("n", "<S-h>", "<Esc>:tabprevious<cr>", { silent = true })
keymap("n", "<S-l>", "<Esc>:tabnext<cr>", { silent = true })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<Leader>c", ":bdelete<cr>", { silent = true })

-- Netwr
keymap("n", "<Leader>e", ":Lexplore<cr>", { silent = true })
