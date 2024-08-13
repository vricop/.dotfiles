return {
  'folke/which-key.nvim',
  enabled = enable_plugins['which-key'],
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    require('which-key').add {
      { '<Leader>f', group = 'Find' },
      { '<Leader>fg', group = 'Find git' },
      { '<Leader>g', group = 'Git' },
      { '<Leader>l', group = 'Lsp' },
      { '<Leader>t', group = 'Toggle' },
      { '<Leader>tg', group = 'Toggle git' },
    }
  end,
  opts = {
    preset = 'helix',
    icons = {
      rules = false,
      breadcrumb = '',
      separator = '',
      group = '',
    },
  },
  config = true,
}
