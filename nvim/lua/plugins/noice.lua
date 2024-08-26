return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  enabled = enable_plugins.noice,
  dependencies = { 'MunifTanjim/nui.nvim' },
  opts = {
    cmdline = {
      format = {
        cmdline = {
          icon = [[ ]],
        },
        search_down = {
          icon = [[ 󰶡]],
        },
        search_up = {
          icon = [[ 󰶣]],
        },
        help = {
          icon = [[󰋗 ]],
        },
      },
    },
  },
}
