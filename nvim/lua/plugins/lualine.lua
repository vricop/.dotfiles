return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  enabled = enable_plugins.lualine,
  opts = {
    options = {
      icons_enabled = true,
      theme = 'catppuccin-macchiato',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true, -- vim.opt.laststatus = 3
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = {
        { 'mode' },
      },
      lualine_b = {
        { 'branch', icon = '󰘬' },
      },
      lualine_c = {
        { 'filename' },
        {
          'diff',
          symbols = {
            added = ' ',
            modified = ' ',
            removed = ' ',
          },
        },
      },
      lualine_x = {},
      lualine_y = { 'diagnostics' },
      lualine_z = { { 'location', icon = [[󰉡]] } },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}
