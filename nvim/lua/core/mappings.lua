local keymap = require "core.utils".keymap

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

keymap({ "n", "x" }, ";", ":", { desc = "Enter command mode", noremap = false })
keymap("n", "<Esc>", ":noh<cr>", { desc = "Stop highlighting" })
keymap("n", "<Leader>w", ":up<Cr>", { desc = "Save buffer" })
keymap("n", "<Leader>s", ":wa<Cr>", { desc = "Save buffers" })
keymap("n", "<Leader>d", ":bd<Cr>", { desc = "Close buffer" })
keymap("n", "<Leader>x", "<cmd>bufdo bd<Cr>", { desc = "Close all buffers" })
keymap("n", "J", "mzJ`z", { desc = "Join lines and center screen" })
keymap("n", "H", "<Esc>:tabprevious<cr>", { desc = "Move previous tab" })
keymap("n", "L", "<Esc>:tabnext<cr>", { desc = "Move next tab" })
keymap("v", M_j, ":m '>+1<Cr>gv=gv", { desc = "Move line down" })
keymap("n", M_j, ":m .+1<Cr>==", { desc = "Move line down" })
keymap("v", M_k, ":m '<-2<Cr>gv=gv", { desc = "Move line up" })
keymap("n", M_k, ":m .-2<Cr>==", { desc = "Move line up" })
keymap("n", M_J, ":t+0<Cr>", { desc = "Duplicate line below" })
keymap("v", M_J, ":t'>+0<Cr>", { desc = "Duplicate line below" })
keymap("n", M_K, ":t-1<Cr>", { desc = "Duplicate line above" })
keymap("v", M_K, ":t'<-1<Cr>", { desc = "Duplicate line above" })
keymap("n", "<Tab>", ">>", { desc = "Shift line right" })
keymap("n", "<S-Tab>", "<<", { desc = "Shift line left" })
keymap("v", "<Tab>", ">gv", { desc = "Shift line right" })
keymap("v", "<S-Tab>", "<gv", { desc = "Shift line left" })
keymap("n", "n", "nzz", { desc = "Next occurrency & center" })
keymap("n", "N", "Nzz", { desc = "Previous occurrency & center" })
keymap("n", "*", "*zz", { desc = "Next occurrency & center" })
keymap("n", "#", "#zz", { desc = "Previous occurrency & center" })
keymap("n", "g*", "g*zz", { desc = "Next occurrency & center" })
keymap("n", "g#", "g#zz", { desc = "Previous occurrency & center" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Move screen up & center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Move screen down & center" })
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to window left" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to window top" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to window down" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to window right" })
keymap("n", "<C-c>", "<C-w><C-w>", { desc = "Cycle windows" })
keymap(
  "n",
  "<Leader>/",
  ":%s@\\v<<C-r><C-w>>@@gc<Left><Left><Left>",
  { desc = "Find & replace word under cursor", silent = false }
)
keymap("n", "<Leader>:", ":lua= ", { desc = "Print lua scripts under command mode", silent = false })
keymap("n", "<Leader>fk", ":map<Cr>", { desc = "Find keymaps" })
keymap("n", '<Leader>fr', ":registers<Cr>", { desc = "Find registers" })
keymap("n", "<Leader>fm", ":marks<Cr>", { desc = "Find marks" })
keymap({ "n", "v" }, "gh", "^", { desc = "Go to the first non blank character" })
keymap({ "n", "v" }, "gl", "g_", { desc = "Go to the last non blank character" })
keymap("n", "<Leader>q", ":qa<Cr>", { desc = "Quit Neovim" })
keymap("n", "<Leader>c", ":q<Cr>", { desc = "Quit window" })
keymap("n", "<Leader>|", "<C-w>v", { desc = "Split vertically" })
keymap("n", "<Leader>-", "<C-w>s", { desc = "Split horizontally" })
keymap("n", "<Leader>tn", toggle_relative_number, { desc = "Toggle relative numbers" })
keymap("n", "]q", ":cn<Cr>", { desc = "Next item in quickfix list" })
keymap("n", "[q", ":cp<Cr>", { desc = "Previous item in quickfix list" })
-- keymap("t",          "<Esc>",       [[<C-\><C-n>]],                              { desc = "Previous item in quickfix list"})
keymap("n", "<Leader>e", ":Lexplore<Cr>", { desc = "Toggle Netwr" })
-- Swap words leaving cursor on initial position using marks
keymap("n", "gsh", "mayiwbviwpwvep`a", { desc = "Swap word left" })
keymap("n", "gsl", "mayiwwviwpbbviwp`a", { desc = "Swap word right" })
keymap("x", "p", [["_dP"]])

keymap("n", "<Leader>ff", function()
  -- If empty buffer, reuse it
  if vim.fn.bufname(0) == "" then
    return ":find<Space>"
  end

  -- Otherwise open in in a new tab
  return ":tabnew | find<Space>"
end, { desc = "Find files", expr = true }) -- Allow {rhs} to be taken as an expression
