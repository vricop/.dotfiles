return {
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      local which_key = require 'which-key'

      which_key.setup {
        preset = 'helix',
        icons = {
          rules = false,
          breadcrumb = '',
          separator = '',
          group = '',
        },
      }

      which_key.add {
        { '<Leader>b', group = 'Buffer' },
        { '<Leader>f', group = 'Find' },
        { '<Leader>fg', group = 'Find git' },
        { '<Leader>g', group = 'Git' },
        { '<Leader>l', group = 'Lsp' },
        { '<Leader>t', group = 'Toggle' },
        { '<Leader>tg', group = 'Toggle git' },
      }
    end,
  },
}
