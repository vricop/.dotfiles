vim.opt.backup = false                                  -- Creates a backup file
vim.opt.clipboard = "unnamedplus"                       -- Clipboard mode, `unnamedplus` is for the system clipboard
vim.opt.cmdheight = 1                                   -- Command line height
vim.opt.colorcolumn = "80"                              -- Show vertical column line
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Mostly just for cmp
vim.opt.conceallevel = 0                                -- So that `` is visible in markdown files
vim.opt.cursorline = true                               -- Highlight the current line
vim.opt.expandtab = true                                -- Convert tabs to spaces
vim.opt.fileencoding = "utf-8"                          -- The encoding written to a file
vim.opt.guifont = "IosevkaTerm Nerd Font Propo:h18"     -- The font used in graphical neovim applications
vim.opt.hlsearch = true                                 -- Highlight all matches on previous search pattern
vim.opt.ignorecase = true                               -- Ignore case in search patterns
vim.opt.laststatus = 3                                  -- Enable global statusline
vim.opt.lazyredraw = false                              -- Improve performance, especially when executing macros
vim.opt.number = true                                   -- Set numbered lines
vim.opt.numberwidth = 2                                 -- Set number column width to 2 {default 4}
vim.opt.pumheight = 10                                  -- Pop up menu height
-- vim.opt.relativenumber = true -- Set relative numbered lines
vim.opt.scrolloff = 8                                   -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.shiftwidth = 2                                  -- The number of spaces inserted for each indentation
vim.opt.showmode = false                                -- We don't need to see things like -- INSERT -- anymore
vim.opt.showcmdloc = "statusline"                       -- Remove selection count in cmdline
vim.opt.showtabline = 0                                 -- Show/Hide tabs
vim.opt.sidescrolloff = 8                               -- The minimal number of screen columns to keep to the both sides of the cursor if `'nowrap'`  is set.
vim.opt.signcolumn = "yes"                              -- Sign column (number, diagnostics, etc)
vim.opt.smartcase = true                                -- Smart case
vim.opt.smartindent = true                              -- Make indenting smarter again
vim.opt.spell = true                                    -- Enable spelling
vim.opt.spelllang = { "en", "fr", "ca", "it" }          -- Install spelling for these languages
vim.opt.spelloptions = { "camel" }                      -- Spell options, separate camel case words
vim.opt.splitbelow = true                               -- Force all horizontal splits to go below current window
vim.opt.splitright = true                               -- Force all vertical splits to go to the right of current window
vim.opt.swapfile = false                                -- Creates a swapfile
vim.opt.tabstop = 2                                     -- Tabs
vim.opt.termguicolors = true                            -- Set term gui colors (most terminals support this)
-- vim.opt.timeoutlen = 350 -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                                 -- Enable persistent undo
vim.opt.updatetime = 300                                -- Faster completion (4000ms default)
vim.opt.wrap = false                                    -- Display lines as one long line
vim.opt.writebackup = false                             -- If a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.cursorcolumn = true                             -- Draw vertical column for the cursor position
vim.opt.pumheight = 10                                  -- Pop up menu height
vim.opt.grepprg = "rg --vimgrep --smart-case"           -- Use ripgrep instead of grep
vim.opt.grepformat = "%f:%l:%c:%m"                      -- Use this cli format for ripgrep
vim.opt.statuscolumn = "%s %l "
vim.opt.list = true
vim.opt.wrap = true

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.opt.listchars = {
  tab = " ",
  space = "·",
  trail = "·",
  extends = "›",
  precedes = "‹",
  nbsp = "␣",
}

vim.opt.shortmess:append("c")                   -- Hide short messages, `appends` means don't show message (specified with a letter)
vim.opt.whichwrap:append("<,>,[,],h,l")         -- Set what commands wrap to the next line when at the end of the line
vim.opt.wildignore:append("**/node_modules/**") -- Don't show results from `node_modules` recursively
vim.opt.path:append("**")                       -- Tell Neovim to look in all subdirectories relative to the current directory when searching for a file
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.cmd("colorscheme unokai")
vim.cmd("highlight WinSeparator guibg=None") -- Thin split lines
vim.g.mapleader = " "                        -- Set leader key
vim.o.exrc = true                            -- Automatically execute .nvim.lua, .nvimrc, and .exrc files in the current directory
