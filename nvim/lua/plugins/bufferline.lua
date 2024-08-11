return {
  'akinsho/bufferline.nvim',
  enabled = enable_plugins.bufferline,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = true,
  lazy = false,
  opts = {
    options = {
      mode = 'buffers',
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
