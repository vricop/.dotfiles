return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require'gitsigns'

      gitsigns.setup({
        on_attach = function()
          local map = vim.keymap.set

          map( 'n', ']h',         gitsigns.next_hunk,       { desc = 'Go next hunk' })
          map( 'n', '[h',         gitsigns.prev_hunk,       { desc = 'Go prev hunk' })
          map( 'n', '<Leader>gp', gitsigns.preview_hunk,    { desc = 'Preview hunk' })
          map( 'n', '<Leader>gu', gitsigns.undo_stage_hunk, { desc = 'Undo hunk' })
          map( 'n', '<Leader>gr', gitsigns.reset_buffer,    { desc = 'Reset buffer' })
        end
      })
    end,
  }
}
