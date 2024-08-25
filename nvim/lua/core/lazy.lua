local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'

  local out = vim.fn.system {
    'git clone --filter=blob:none --branch=stable',
    lazyrepo,
    lazypath,
  }

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
  end

  vim.fn.getchar()
  os.exit(1)
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    { import = 'plugins' },
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  checker = {
    enabled = false
  }
}

vim.keymap.set('n', '<Leader>z', '<Cmd>Lazy<Cr>', {
  desc = 'Open Lazy',
  silent = true,
})
