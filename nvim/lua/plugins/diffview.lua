return {
  'sindrets/diffview.nvim',
  enabled = enable_plugins.diffview,
  init = function()
    require('which-key').add {
      { '<Leader>D', group = 'Diffview' },
    }
  end,
  keys = {
    { '<Leader>Do', '<Cmd>DiffviewOpen<Cr>', desc = 'Open Diffview' },
    { '<Leader>Dc', '<Cmd>DiffviewClose<Cr>', desc = 'Close Diffview' },
  },
}
