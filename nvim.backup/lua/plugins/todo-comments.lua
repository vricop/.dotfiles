return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  init = function()
    local map, todo_comments = vim.keymap.set, require 'todo-comments'

    map('n', ']t', function()
      todo_comments.jump_next()
    end, { desc = 'Next todo comment' })

    map('n', '[t', function()
      todo_comments.jump_prev()
    end, { desc = 'Previous todo comment' })
  end,
  opts = {
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
      TEST = {
        icon = '󰙨',
        color = 'test',
        alt = { 'TESTING', 'PASSED', 'FAILED' },
      },
    },
  },
}
