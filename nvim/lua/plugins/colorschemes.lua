return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    enabled = enable_plugins.catppuccin,
    config = function()
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  }
}
