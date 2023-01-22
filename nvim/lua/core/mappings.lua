local keymap = vim.keymap.set

keymap("n", "<Leader>h",  ":nohlsearch<cr>",                           { desc = "Stop highlighting", silent = true })
keymap("n", "<Leader>w",  ":w<cr>",                                    { desc = "Save file", silent = true })
keymap("n", "<Leader>wa", ":wa<Cr>",                                   { desc = "Save all files", silent = true,})
keymap("n", "J",          "mzJ`z",                                     { desc = "Join lines and center screen" }) -- From ThePrimeagen
keymap("n", "<S-h>",      "<Esc>:tabprevious<cr>",                     { desc = "Move previous tab", silent = true,  })
keymap("n", "<S-l>",      "<Esc>:tabnext<cr>",                         { desc = "Move next tab", silent = true })
keymap("v", "<C-j>",      ":m '>+1<Cr>gv=gv",                          { desc = "Move line up"})
keymap("v", "<C-k>",      ":m '<-2<Cr>gv=gv",                          { desc = "Move line down"})
keymap("n", "<Tab>",      ">>",                                        { desc = "Shift line right" })
keymap("n", "<S-Tab>",    "<<",                                        { desc = "Shift line left" })
keymap("v", "<Tab>",      ">gv",                                       { desc = "Shift line right" })
keymap("v", "<S-Tab>",    "<gv",                                       { desc = "Shift line left" })
keymap("n", "<C-d>",      "<C-d>zz",                                   { desc = "Move screen up & center"})
keymap("n", "<C-u>",      "<C-u>zz",                                   { desc = "Move screen down & center"})
keymap("n", "<C-h>",      "<C-w>h",                                    { desc = "Move to window left"})
keymap("n", "<C-j>",      "<C-w>j",                                    { desc = "Move to window top"})
keymap("n", "<C-k>",      "<C-w>k",                                    { desc = "Move to window down"})
keymap("n", "<C-l>",      "<C-w>l",                                    { desc = "Move to window right"})
keymap("n", "<Leader>c",  ":bdelete<cr>",                              { desc = "Close buffer", silent = true,})
keymap("n", "<Leader>e",  ":Lexplore<cr>",                             { desc = "Toggle Netwr", silent = true,})
keymap("n", "<Leader>w",  ":w<Cr>",                                    { desc = "Save file", silent = true,})
keymap("n", "<Leader>r",  ":source $MYVIMRC<Cr>",                      { desc = "Reload config", silent = true,})
keymap("n", "<Leader>*",  ":%s/\\v<<C-r><C-w>>//gc<Left><Left><Left>", { desc = "Find & replace word under cursor" })
keymap("n", "<Leader>p",  ":lua= ",                                    { desc = "Print lua scripts" })
keymap("n", "<Leader>sr", ":registers<Cr>",                            { desc = "See registers", silent = true })
keymap("n", "<Leader>sm", ":map<Cr>",                                  { desc = "See maps", silent = true })

-- "Native" fuzzy finder (Set `vim.opt.path:append "**"` for better results)
keymap("n", "<Leader>f", function ()
  -- If empty buffer, reuse it
  if vim.fn.bufname("%") == "" then
    return ":find<Space>"
  end

  -- Otherwise open in in a new tab
  return ":tabnew | find<Space>"

end, {
  desc = "Find & Replace word under cursor",
  expr = true -- Allow {rhs} to be taken as an expression
})

