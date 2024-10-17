local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local o = vim.o

opt.backup = false -- Creates a backup file
opt.clipboard = 'unnamedplus' -- Allows neovim to access the system clipboard
opt.cmdheight = 1 -- Command line height
opt.colorcolumn = '80' -- Show vertical column line
opt.completeopt = { 'menu', 'menuone', 'noselect' } -- Mostly just for cmp
opt.conceallevel = 0 -- So that `` is visible in markdown files
opt.cursorline = true -- Highlight the current line
opt.expandtab = true -- Convert tabs to spaces
opt.fileencoding = 'utf-8' -- The encoding written to a file
opt.guifont = 'IosevkaTerm Nerd Font Propo:h18' -- The font used in graphical neovim applications
opt.hlsearch = true -- Highlight all matches on previous search pattern
opt.ignorecase = true -- Ignore case in search patterns
opt.laststatus = 3 -- Enable global statusline
opt.lazyredraw = false -- Improve performance, especially when executing macros
opt.mouse = 'a' -- Allow the mouse to be used in neovim
opt.number = true -- Set numbered lines
opt.numberwidth = 2 -- Set number column width to 2 {default 4}
opt.pumheight = 10 -- Pop up menu height
opt.relativenumber = true -- Set relative numbered lines
opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor.
opt.shiftwidth = 2 -- The number of spaces inserted for each indentation
opt.showmode = false -- We don't need to see things like -- INSERT -- anymore
opt.showtabline = 2 -- Always show tabs
opt.sidescrolloff = 8 -- The minimal number of screen columns to keep to the both sides of the cursor if `'nowrap'`  is set.
opt.signcolumn = 'yes' -- Always show the sign column otherwise it would shift the text each time
opt.smartcase = true -- Smart case
opt.smartindent = true -- Make indenting smarter again
opt.spell = true -- Enable spelling
opt.spelllang = { 'en', 'fr', 'ca', 'it' } -- Install spelling for these languages
opt.splitbelow = true -- Force all horizontal splits to go below current window
opt.splitright = true -- Force all vertical splits to go to the right of current window
opt.swapfile = false -- Creates a swapfile
opt.tabstop = 2 -- Insert 2 spaces for a tab
opt.termguicolors = true -- Set term gui colors (most terminals support this)
opt.timeoutlen = 1000 -- Time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- Enable persistent undo
opt.updatetime = 300 -- Faster completion (4000ms default)
opt.wrap = false -- Display lines as one long line
opt.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
opt.cursorcolumn = true -- Draw vertical column for the cursor position
opt.pumheight = 10 -- Pop up menu height
opt.grepprg = 'rg --vimgrep --smart-case' -- Use ripgrep instead of grep
opt.grepformat = '%f:%l:%c:%m' -- Use this cli format for ripgrep
g.mapleader = ' ' -- Set leader key
g.netrw_banner = 0 -- Remove header for netrw file explorer
g.netrw_liststyle = 3 -- Show tree-like list style
g.netrw_browser_split = 4 -- Open file by: previous window (4)
g.netrw_winsize = 20 -- Explorer width
g.netrw_altv = 1 -- Change from left splitting to right splitting

--- OTHER SETTINGS
cmd 'colorscheme habamax'
cmd 'highlight WinSeparator guibg=None' -- Thin split lines
opt.path:append '**' -- Tell Neovim to look in all subdirectories relative to the current directory when searching for a file
-- opt.shortmess:append "I"                               -- Don't show the default intro message
opt.shortmess:append 'c' -- Don't show redundant messages from ins-completion-menu
opt.spelllang:append 'cjk' -- Disable spellchecking for asian characters (VIM algorithm does not support it)
opt.whichwrap:append '<,>,[,],h,l' -- Set what commands wrap to the next line when at the end of the line
opt.wildignore:append '**/node_modules/**' -- Don't show results from `node_modules` recursively

o.exrc = true -- Automatically execute .nvim.lua, .nvimrc, and .exrc files in the current directory

--- CUSTOM VARIABLES ---

-- Custom variable to toggle a diff mode in all split windows. 
-- See `mappings.lua`
_G.is_diff_mode_on = false

--- Languages like Spanish, French & Italian, have accents like áàéè. In macOS
--- this is achieved by using the meta key combined with a letter. iTerm2 
--- --and others terminal emulators-- won't handle this properly. In order to
--- work inside Neovim we need to use the string produced by the <M-*>. This can
--- be achieved by pressing <C-v> before typing the keyboard sequence

if vim.fn.has 'mac' then
  -- macOS users will use these characters
  _G.Meta = {
    j = '∆',
    k = '˚',
    h = '˙',
    l = '¬',
    J = 'Ô',
    K = '',
    q = 'œ',
  }
else
  -- Non macOS users will use these
  _G.Meta = {
    j = '<M-j>',
    k = '<M-k>',
    h = '<M-h>',
    l = '<M-l>',
    J = '<M-J>',
    K = '<M-J>',
    q = '<M-q>',
  }
end
