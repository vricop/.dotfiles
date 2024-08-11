return {
  'sindrets/diffview.nvim',
  enabled = enable_plugins.diffview,
  init = function()
    require('which-key').add {
      { '<Leader>D', group = 'Diffview' },
    }
  end,
  keys = {
    { '<Leader>td', '<CMD>DiffviewOpen<Cr>', desc = 'Toggle: diffview' },
  },
}
