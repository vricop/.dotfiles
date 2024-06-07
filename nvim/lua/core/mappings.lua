local keymap = require "core.utils".keymap

local M_j = "<M-j>"
local M_k = "<M-k>"
local M_h = "<M-h>"
local M_l = "<M-l>"
local M_J = "<M-J>"
local M_K = "<M-J>"

--[[
IMPORTANT: Those who type languages with special characters like Spanish,
French, Italian, need the special macOS meta key (alt or opt) to work properly
inside neovim without modifying its original behaviour. In order to use the
meta key in mappings you need to use the string produced by the <M-*>. This
Can be achieved by pressing <C-v> before typing the keyboard sequence
--]]
if vim.fn.has("mac") then
  M_j = "∆"
  M_k = "˚"
  M_h = "˙"
  M_l = "¬"
  M_J = "Ô"
  M_K = ""
end

keymap("n", "U", "<C-r>", { desc = "Redo last change" })
keymap({ "n", "x" }, ";", ":", { desc = "Enter command mode", silent = false })
keymap("n", "<Esc>", ":noh<cr>", { desc = "Stop highlighting" })
keymap("n", "<Leader>w", ":up<Cr>", { desc = "Update buffer" })
keymap("n", "<Leader>s", ":wa<Cr>", { desc = "Write all buffers" })
keymap("n", "<Leader>d", ":bd<Cr>", { desc = "Delete buffer" })
keymap("n", "<Leader>x", ":bufdo bd<Cr>", { desc = "Close all buffers" })
keymap("n", "<Leader>q", ":qa<Cr>", { desc = "Quit Neovim" })
keymap("n", "<Leader>c", ":close<Cr>", { desc = "Close window" })
keymap("n", "<Leader>B", ":bufdo tabedit %<Cr>", { desc = "Open all buffers in tabs" })
keymap("n", "J", "mzJ`z", { desc = "Join lines and center screen" })
keymap("n", M_h, "gT", { desc = "Previous tab" })
keymap("n", M_l, "gt", { desc = "Next tab" })
keymap("n", "H", ":bp<Cr>", { desc = "Previous buffer" })
keymap("n", "L", ":bn<Cr>", { desc = "Next buffer" })
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
keymap("n", "<Leader>v", "<C-w>v", { desc = "Split vertically" })
keymap("n", "<Leader>h", "<C-w>s", { desc = "Split horizontally" })
keymap("n", "]q", ":cn<Cr>", { desc = "Next item in quickfix list" })
keymap("n", "[q", ":cp<Cr>", { desc = "Previous item in quickfix list" })

-- Swap words leaving cursor on initial position using marks
keymap("n", "gsh", "mayiwbviwpwvep`a", { desc = "Swap word left" })
keymap("n", "gsl", "mayiwwviwpbbviwp`a", { desc = "Swap word right" })

keymap("x", "p", [["_dP"]])
keymap("i", "jj", '<Esc>')
keymap("n", "Q", "@q", { desc = "Run macro on regiser \"q" })

keymap('n', '<Leader>r',
  function()
    local repetead_key = ''

    for _ = 1, 18 do
      repetead_key = repetead_key .. '<Left>'
    end

    return string.format(':cfdo %%s###gc | update | bd%s', repetead_key)
  end, {
    desc = 'Run substitute from quickfix file list',
    silent = false,
    expr = true
  }
)

keymap("n", "<Leader>ff", ":find<Space>**/", {
  desc = "Find files",
  silent = false
})

-- Toggle mappings --
keymap("n", "<Leader>e", ":Lexplore<Cr>", { desc = "Toggle Netwr" })

keymap("n", "<Leader>ti", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end, { desc = 'Toggle Inlay hint', silent = true })

keymap("n", "<Leader>tr", function()
  vim.o.relativenumber = not vim.o.relativenumber
end, { desc = "Toggle relative numbers", silent = true })

keymap("n", "<Leader>tc", function()
  vim.o.conceallevel = vim.o.conceallevel == 0 and 2 or 0
end, { desc = "Toggle conceal", silent = true })

keymap("n", "<Leader>tl", function()
  vim.o.lazyredraw = not vim.o.lazyredraw
end, { desc = "Toggle lazyredraw" })
