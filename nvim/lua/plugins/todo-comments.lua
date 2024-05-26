return {
  {
    {
      'folke/todo-comments.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local keymap = require('core.utils').keymap

        keymap('n', '<Leader>fT', ':TodoTelescope<Cr>', {
          desc = "Open TODO items in Telescope",
          silent = true
        })

        require 'todo-comments'.setup {
          keywords = {
            FIX = {
              icon = ' ',
              color = 'error',
              alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
            },
            TODO = { icon = '󰸞 ', color = 'info' },
            HACK = { icon = ' ', color = 'warning' },
            WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
            PERF = { icon = '󰾆 ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
            NOTE = { icon = '󰠮 ', color = 'hint', alt = { 'INFO' } },
            TEST = { icon = '󰙨', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
          }
        }
      end
    }
  }
}
