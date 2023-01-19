local keymap = vim.keymap.set
-- Stop highlighting
keymap("n", "<Leader>h", ":nohlsearch<cr>", { silent = true }) -- Stop highlighting
keymap("n", "<C-s>", ":w<cr>", { silent = true }) -- Save file

-- Improved "join lines". It sets a mark at "z" so we can move back to that
-- position after each "J" keypress. I took this from ThePrimeagen
keymap("n", "J", "mzJ`z")

-- Tab navigation
keymap("n", "<S-h>", "<Esc>:tabprevious<cr>", { silent = true })
keymap("n", "<S-l>", "<Esc>:tabnext<cr>", { silent = true })

-- Move lines up/down
keymap("v", "<C-j>", ":m '>+1<Cr>gv=gv")
keymap("v", "<C-k>", ":m '<-2<Cr>gv=gv")

-- Better vertical navigation jumps
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<Leader>c", ":bdelete<cr>", { silent = true })

-- Toggle Netwr
keymap("n", "<Leader>e", ":Lexplore<cr>",
  { silent = true, desc = "Toggle Netwr" }
)

-- Save file & save all files
keymap("n", "<Leader>w", ":w<Cr>", { silent = true })
keymap("n", "<Leader>wa", ":wa<Cr>", { silent = true })

-- Reload config
keymap("n", "<Leader>r", ":source $MYVIMRC<Cr>",
  { silent = true, desc = "Reload config" }
)

-- Find & replace
keymap("n", "<Leader>,", ":%s/\\v<<C-r><C-w>>//gc<Left><Left><Left>",
  { desc = "Find & replace word under cursor" }
)

-- Native fuzzy search (once `vim.opt.path:append "**"` has been added)
-- NOTE: It'll open files in a new tab
keymap("n", "<Leader>f", ":tabnew | find<Space>",
  { desc = "Find files" }
)
