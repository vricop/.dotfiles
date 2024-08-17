return {
  'akinsho/bufferline.nvim',
  enabled = enable_plugins.bufferline,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  opts = {
    options = {
      mode = 'tabs',
    },
  },
  keys = {
    {
      '<Leader>b',
      '<Cmd>BufferLinePick<Cr>',
      desc = 'Jump to tab',
      silent = true,
    },
  },
}
