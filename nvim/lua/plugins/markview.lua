return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  enable_plugins = enable_plugins.markview,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    {
      '<leader>tm',
      '<cmd>Markview<cr>',
      noremap = true,
      desc = 'Toggle Markview',
    },
  },
}
