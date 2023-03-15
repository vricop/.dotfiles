local map = vim.keymap.set

map("n", ";", ":nohlsearch<cr>", { desc = "Stop highlighting", silent = true })
map("n", "<Space>s", ":w<Cr>", { desc = "Save buffer", silent = true })
map("n", "<Leader>S", ":wa<Cr>", { desc = "Save buffers", silent = true })
map("n", "J", "mzJ`z", { desc = "Join lines and center screen" }) -- From ThePrimeagen
map("n", "<S-h>", "<Esc>:tabprevious<cr>", { desc = "Move previous tab", silent = true })
map("n", "<S-l>", "<Esc>:tabnext<cr>", { desc = "Move next tab", silent = true })
map("v", "<S-j>", ":m '>+1<Cr>gv=gv", { desc = "Move line up" })
map("v", "<S-k>", ":m '<-2<Cr>gv=gv", { desc = "Move line down" })
map("n", "<Tab>", ">>", { desc = "Shift line right" })
map("n", "<S-Tab>", "<<", { desc = "Shift line left" })
map("v", "<Tab>", ">gv", { desc = "Shift line right" })
map("v", "<S-Tab>", "<gv", { desc = "Shift line left" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move screen up & center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move screen down & center" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to window top" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window down" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to window right" })
map("n", "<Leader>c", ":bdelete<cr>", { desc = "Close buffer", silent = true })
map("n", "<Leader>r", ":luafile $MYVIMRC<Cr>", { desc = "Reload config", silent = true })
map("n", "<Leader>*", ":%s/\\v<<C-r><C-w>>//gc<Left><Left><Left>", { desc = "Find & replace word under cursor" })
map("n", "<Leader>:", ":lua= ", { desc = "Print lua scripts" })
map("n", "<Leader>fk", ":map<Cr>", { desc = "Find keymaps" })
map("n", "<Leader>f\"", ":registers<Cr>", { desc = "Find registers" })
map("n", "<Leader>f`", ":marks<Cr>", { desc = "Find marks" })

-- Fallback to native fuzzy finder (`find` command)
local is_telescope_loaded, _ = pcall(require, 'telescope')

if not is_telescope_loaded then
  -- "Native" fuzzy finder (Set `vim.opt.path:append "**"` for better results)
  map("n", "<Leader>ff", function()
    -- If empty buffer, reuse it
    if vim.fn.bufname(0) == "" then
      return ":find<Space>"
    end

    -- Otherwise open in in a new tab
    return ":tabnew | find<Space>"
  end, {
    desc = "Find files",
    expr = true, -- Allow {rhs} to be taken as an expression
    remap = true
  })
end

-- Fallback to default file tree explorer (Netwr)
local is_nvim_tree_loaded = pcall(require, 'nvim-tree')

if not is_nvim_tree_loaded then
  map("n", "<Leader>e", ":Lexplore<Cr>", {
    desc = "Toggle Netwr",
    silent = true,
    noremap = true
  })
end
