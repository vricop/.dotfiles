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
    },
    sections = {
      lualine_a = {
        {
          'mode',
          fmt = function(mode)
            return mode:sub(1, 1)
          end,
        },
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
      lualine_x = { 'diagnostics', 'filetype' },
      lualine_y = {},
      lualine_z = { 'location' },
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
