--[[
Sane default to work well even without plugins
Inspired in AstroNvim, LunarVim, NVChand and others
--]]

local options = {
  opt = {
    backup = false, -- Creates a backup file
    clipboard = "unnamedplus", -- Allows neovim to access the system clipboard
    cmdheight = 1, -- More space in the neovim command line for displaying messages
    colorcolumn = "80", -- Show vertical column line
    completeopt = { "menu", "menuone", "noselect" }, -- Mostly just for cmp
    conceallevel = 0, -- So that `` is visible in markdown files
    cursorline = true, -- Highlight the current line
    expandtab = true, -- Convert tabs to spaces
    fileencoding = "utf-8", -- The encoding written to a file
    guifont = "PragmataProLiga Nerd Font:h17", -- The font used in graphical neovim applications
    hlsearch = true, -- Highlight all matches on previous search pattern
    ignorecase = true, -- Ignore case in search patterns
    laststatus = 3, -- Enable global statusline
    mouse = "a", -- Allow the mouse to be used in neovim
    number = true, -- Set numbered lines
    numberwidth = 2, -- Set number column width to 2 {default 4}
    pumheight = 10, -- Pop up menu height
    relativenumber = true, -- Set relative numbered lines
    scrolloff = 8,
    shiftwidth = 2, -- The number of spaces inserted for each indentation
    showmode = false, -- We don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- Always show tabs
    sidescrolloff = 8,
    signcolumn = "yes", -- Always show the sign column, otherwise it would shift the text each time
    smartcase = true, -- Smart case
    smartindent = true, -- Make indenting smarter again
    spell = true, -- Enable spelling
    spelllang = { 'en', 'fr', 'ca', 'it' }, -- Install & recognise these languages
    splitbelow = true, -- Force all horizontal splits to go below current window
    splitright = true, -- Force all vertical splits to go to the right of current window
    swapfile = false, -- Creates a swapfile
    tabstop = 2, -- Insert 2 spaces for a tab
    termguicolors = true, -- Set term gui colors (most terminals support this)
    timeoutlen = 1000, -- Time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- Enable persistent undo
    updatetime = 300, -- Faster completion (4000ms default)
    wrap = false, -- Display lines as one long line
    writebackup = false, -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  },

  g = {
    mapleader = " ", -- Set leader key
    netrw_banner = 0, -- Remove header for netrw file explorer
    netrw_liststyle = 3, -- Show tree-like list style
    netrw_browser_split = 4,
    netrw_winsize = 20, -- Explorer width
    netrw_altv = 1,
  }
}

for namespace, namespace_options in pairs(options) do
  for option, value in pairs(namespace_options) do
    vim[namespace][option] = value
  end
end

--- SETTINGS ---
vim.cmd "colorscheme habamax"
vim.cmd "highlight WinSeparator guibg=None" -- Thin split lines
vim.opt.spelllang:append "cjk" -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.opt.shortmess:append "c" -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append "I" -- don't show the default intro message
vim.opt.whichwrap:append "<,>,[,],h,l"
