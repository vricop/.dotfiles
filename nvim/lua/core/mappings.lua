local map = vim.keymap.set

local opts = function(desc, opts)
  opts = opts or {}

  local default_opts = {
    noremap = true,
    desc = desc,
    silent = true
  }

  opts = vim.tbl_extend('force', default_opts, opts)

  return opts
end

--[[
macOS special mappings

* ∆ = <M-j>
* ˚ = <M-k>
* Ô = <M-J>
*  = <M-K>
--]]
map("n",          ";",           ":nohlsearch<cr>",                           opts("Stop highlighting"))
map("n",          "<Space>s",    ":update<Cr>",                               opts("Save buffer"))
map("n",          "<Leader>w",   ":wa<Cr>",                                   opts("Save buffers"))
map("n",          "J",           "mzJ`z",                                     opts("Join lines and center screen"))
map("n",          "H",           "<Esc>:tabprevious<cr>",                     opts("Move previous tab"))
map("n",          "L",           "<Esc>:tabnext<cr>",                         opts("Move next tab"))
map("v",          "∆",           ":m '>+1<Cr>gv=gv",                          opts("Move line down"))
map("n",          "∆",           ":m .+1<Cr>==",                              opts("Move line down"))
map("v",          "˚",           ":m '<-2<Cr>gv=gv",                          opts("Move line up"))
map("n",          "˚",           ":m .-2<Cr>==",                              opts("Move line up"))
map("n",          "Ô",           ":t+0<Cr>",                                  opts("Duplicate line below"))
map("v",          "Ô",           ":t'>+0<Cr>",                                opts("Duplicate line below"))
map("n",          "",           ":t-1<Cr>",                                  opts("Duplicate line above"))
map("v",          "",           ":t'<-1<Cr>",                                opts("Duplicate line above"))
map("n",          "<Tab>",       ">>",                                        opts("Shift line right" ))
map("n",          "<S-Tab>",     "<<",                                        opts("Shift line left" ))
map("v",          "<Tab>",       ">gv",                                       opts("Shift line right" ))
map("v",          "<S-Tab>",     "<gv",                                       opts("Shift line left" ))
map("n",          "<C-d>",       "<C-d>zz",                                   opts("Move screen up & center"))
map("n",          "<C-u>",       "<C-u>zz",                                   opts("Move screen down & center"))
map("n",          "<C-h>",       "<C-w>h",                                    opts("Move to window left"))
map("n",          "<C-j>",       "<C-w>j",                                    opts("Move to window top"))
map("n",          "<C-k>",       "<C-w>k",                                    opts("Move to window down"))
map("n",          "<C-l>",       "<C-w>l",                                    opts("Move to window right"))
map("n",          "<C-c>",       "<C-w><C-w>",                                opts("Cycle windows"))
map("n",          "<Leader>c",   ":bdelete<cr>",                              opts("Close buffer"))
map("n",          "<Leader>r",   ":luafile $MYVIMRC<Cr>",                     opts("Reload config"))
map("n",          "<Leader>*",   ":%s@\\v<<C-r><C-w>>@@gc<Left><Left><Left>", opts("Find & replace word under cursor", { silent = false }))
map("n",          "<Leader>:",   ":lua= ",                                    opts("Print lua scripts"))
map("n",          "<Leader>fk",  ":map<Cr>",                                  opts("Find keymaps"))
map("n",          '<Leader>f"',  ":registers<Cr>",                            opts("Find registers"))
map("n",          "<Leader>f`",  ":marks<Cr>",                                opts("Find marks"))
map({ "n", "v" }, "gh",          "^",                                         opts("Go to the first non blank character"))
map({ "n", "v" }, "gl",          "g_",                                        opts("Go to the last non blank character"))
map("n",          "<Leader>q",   ":qa<Cr>",                                   opts("Quit vim"))
map("n",          "<Leader>|",   ":vsp<Cr>",                                  opts("Split vertically"))
map("n",          "<Leader>-",   ":sp<Cr>",                                   opts("Split horizontally"))

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
