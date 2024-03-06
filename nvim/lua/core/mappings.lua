local map = vim.keymap.set
---@class MappingOpts
---@field noremap? boolean
---@field silent? boolean

---Function for describing maps with default table options
---@param desc string
---@param opts? MappingOpts
local opts = function(desc, opts)
  opts = opts or {}

  local default_opts = {
    noremap = true,
    desc = desc,
    silent = true,
  }

  opts = vim.tbl_extend("force", default_opts, opts)

  return opts
end

local function toggle_relative_number()
  local opt = vim.opt
  if opt.relativenumber:get() then
    opt.relativenumber = false
  else
    opt.relativenumber = true
  end
end

local M_j = "<M-j>"
local M_k = "<M-k>"
local M_J = "<M-J>"
local M_K = "<M-J>"

if vim.fn.has("mac") then
  -- macOS special mappings. This solve some issues with meta key.
  M_j = "∆"
  M_k = "˚"
  M_J = "Ô"
  M_K = ""
end

map({ "n", "x" }, ";", ":", opts("Enter command mode", { noremap = false }))
map("n", "<Leader>;", ":noh<cr>", opts("Stop highlighting"))
map("n", "<Leader>w", ":up<Cr>", opts("Save buffer"))
map("n", "<Leader>s", ":wa<Cr>", opts("Save buffers"))
map("n", "<Leader>d", ":bd<Cr>", opts("Close buffer"))
map("n", "J", "mzJ`z", opts("Join lines and center screen"))
map("n", "H", "<Esc>:tabprevious<cr>", opts("Move previous tab"))
map("n", "L", "<Esc>:tabnext<cr>", opts("Move next tab"))
map("v", M_j, ":m '>+1<Cr>gv=gv", opts("Move line down"))
map("n", M_j, ":m .+1<Cr>==", opts("Move line down"))
map("v", M_k, ":m '<-2<Cr>gv=gv", opts("Move line up"))
map("n", M_k, ":m .-2<Cr>==", opts("Move line up"))
map("n", M_J, ":t+0<Cr>", opts("Duplicate line below"))
map("v", M_J, ":t'>+0<Cr>", opts("Duplicate line below"))
map("n", M_K, ":t-1<Cr>", opts("Duplicate line above"))
map("v", M_K, ":t'<-1<Cr>", opts("Duplicate line above"))
map("n", "<Tab>", ">>", opts("Shift line right"))
map("n", "<S-Tab>", "<<", opts("Shift line left"))
map("v", "<Tab>", ">gv", opts("Shift line right"))
map("v", "<S-Tab>", "<gv", opts("Shift line left"))
map("n", "<C-d>", "<C-d>zz", opts("Move screen up & center"))
map("n", "<C-u>", "<C-u>zz", opts("Move screen down & center"))
map("n", "<C-h>", "<C-w>h", opts("Move to window left"))
map("n", "<C-j>", "<C-w>j", opts("Move to window top"))
map("n", "<C-k>", "<C-w>k", opts("Move to window down"))
map("n", "<C-l>", "<C-w>l", opts("Move to window right"))
map("n", "<C-c>", "<C-w><C-w>", opts("Cycle windows"))
map("n", "<Leader>r", ":luafile $MYVIMRC<Cr>", opts("Reload config"))
map(
  "n",
  "<Leader>/",
  ":%s@\\v<<C-r><C-w>>@@gc<Left><Left><Left>",
  opts("Find & replace word under cursor", { silent = false })
)
map("n", "<Leader>:", ":lua= ", opts("Print lua scripts under command mode", { silent = false }))
map("n", "<Leader>fk", ":map<Cr>", opts("Find keymaps"))
map("n", '<Leader>f"', ":registers<Cr>", opts("Find registers"))
map("n", "<Leader>f`", ":marks<Cr>", opts("Find marks"))
map({ "n", "v" }, "gh", "^", opts("Go to the first non blank character"))
map({ "n", "v" }, "gl", "g_", opts("Go to the last non blank character"))
map("n", "<Leader>q", ":qa<Cr>", opts("Quit Neovim"))
map("n", "<Leader>c", ":q<Cr>", opts("Quit window"))
map("n", "<Leader>|", "<C-w>v", opts("Split vertically"))
map("n", "<Leader>-", "<C-w>s", opts("Split horizontally"))
map("n", "<Leader>tn", toggle_relative_number, opts("Toggle relative numbers"))
map("n", "]q", ":cn<Cr>", opts("Next item in quickfix list"))
map("n", "[q", ":cp<Cr>", opts("Previous item in quickfix list"))
-- map("t",          "<Esc>",       [[<C-\><C-n>]],                              opts("Previous item in quickfix list"))
map("n", "<Leader>e", ":Lexplore<Cr>", opts("Toggle Netwr"))

map("n", "<Leader>ff", function()
  -- If empty buffer, reuse it
  if vim.fn.bufname(0) == "" then
    return ":find<Space>"
  end

  -- Otherwise open in in a new tab
  return ":tabnew | find<Space>"
end, opts("Find files", { expr = true })) -- Allow {rhs} to be taken as an expression

return {
  opts = opts,
  map = map,
}
