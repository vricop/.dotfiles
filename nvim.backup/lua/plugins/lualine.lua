return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
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
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          'mode',
          fmt = function(mode)
            return mode:sub(1, 3)
          end,
        },
      },
      lualine_b = {
        { 'branch', icon = '󰘬' },
      },
      lualine_c = {
        {
          'filename',
          symbols = {
            unnamed = '󰦨',
          },
        },
        {
          'diff',
          symbols = {
            added = ' ',
            modified = ' ',
            removed = ' ',
          },
        },
      },
      lualine_x = {
        'diagnostics',
        'filetype',
      },
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
