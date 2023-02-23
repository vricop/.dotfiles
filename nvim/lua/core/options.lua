local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

opt.backup            = false                             -- Creates a backup file
opt.clipboard         = "unnamedplus"                     -- Allows neovim to access the system clipboard
opt.cmdheight         = 1                                 -- More space in the neovim command line for displaying messages
opt.colorcolumn       = "80"                              -- Show vertical column line
opt.completeopt       = { "menu", "menuone", "noselect" } -- Mostly just for cmp
opt.conceallevel      = 0                                 -- So that `` is visible in markdown files
opt.cursorline        = true                              -- Highlight the current line
opt.expandtab         = true                              -- Convert tabs to spaces
opt.fileencoding      = "utf-8"                           -- The encoding written to a file
opt.guifont           = "PragmataProLiga Nerd Font:h17"   -- The font used in graphical neovim applications
opt.hlsearch          = true                              -- Highlight all matches on previous search pattern
opt.ignorecase        = true                              -- Ignore case in search patterns
opt.laststatus        = 3                                 -- Enable global statusline
opt.mouse             = "a"                               -- Allow the mouse to be used in neovim
opt.number            = true                              -- Set numbered lines
opt.numberwidth       = 2                                 -- Set number column width to 2 {default 4}
opt.pumheight         = 10                                -- Pop up menu height
opt.relativenumber    = true                              -- Set relative numbered lines
opt.scrolloff         = 8
opt.shiftwidth        = 2                                 -- The number of spaces inserted for each indentation
opt.showmode          = false                             -- We don't need to see things like -- INSERT -- anymore
opt.showtabline       = 2                                 -- Always show tabs
opt.sidescrolloff     = 8
opt.signcolumn        = "yes"                             -- Always show the sign column otherwise it would shift the text each time
opt.smartcase         = true                              -- Smart case
opt.smartindent       = true                              -- Make indenting smarter again
opt.spell             = true                              -- Enable spelling
opt.spelllang         = { 'en', 'fr', 'ca', 'it' }        -- Install & recognise these languages
opt.splitbelow        = true                              -- Force all horizontal splits to go below current window
opt.splitright        = true                              -- Force all vertical splits to go to the right of current window
opt.swapfile          = false                             -- Creates a swapfile
opt.tabstop           = 2                                 -- Insert 2 spaces for a tab
opt.termguicolors     = true                              -- Set term gui colors (most terminals support this)
opt.timeoutlen        = 1000                              -- Time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile          = true                              -- Enable persistent undo
opt.updatetime        = 300                               -- Faster completion (4000ms default)
opt.wrap              = false                             -- Display lines as one long line
opt.writebackup       = false                             -- If a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
g.mapleader           = " "                               -- Set leader key
g.netrw_banner        = 0                                 -- Remove header for netrw file explorer
g.netrw_liststyle     = 3                                 -- Show tree-like list style
g.netrw_browser_split = 4
g.netrw_winsize       = 20                                -- Explorer width
g.netrw_altv          = 1

--- OTHER SETTINGS
cmd "colorscheme habamax"
cmd "highlight WinSeparator guibg=None"                   -- Thin split lines
opt.path:append "**" 
opt.shortmess:append "I"                                  -- don't show the default intro message
opt.shortmess:append "c"                                  -- don't show redundant messages from ins-completion-menu
opt.spelllang:append "cjk"                                -- disable spellchecking for asian characters (VIM algorithm does not support it)
opt.whichwrap:append "<,>,[,],h,l"
opt.wildignore:append "**/node_modules/**"                -- don't show results from `node_modules` recursively
