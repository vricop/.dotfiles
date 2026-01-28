return {
  'lewis6991/gitsigns.nvim',
  opts = {
    current_line_blame = true,
  },
  config = function(_, opts)
    local gitsigns = require('gitsigns')
    local map = vim.keymap.set

    gitsigns.setup(opts)

    local stage_hunk = function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end

    local reset_hunk = function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end

    local go_next_change = function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gitsigns.nav_hunk('next')
      end
    end

    local go_previous_change = function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gitsigns.nav_hunk('prev')
      end
    end

    map('n', ']c', go_next_change, { desc = 'Go to next change' })
    map('n', '[c', go_previous_change, { desc = 'Got to previous change' })
    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
    map('v', '<leader>hs', stage_hunk, { desc = 'Hunk stage' })
    map('v', '<leader>hr', reset_hunk, { desc = 'Hunk reset' })
    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage hunk (Buffer)' })
    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset hunk (Buffer)' })
    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
    map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk (inline)' })
    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end, { desc = 'Blame line' })
    map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff hunk' })
    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end, { desc = 'Diff this' })
    map('n', '<leader>hQ', function()
      gitsigns.setqflist('all')
    end, { desc = 'Set quickfix list' })
    map('n', '<leader>hq', gitsigns.setqflist, { desc = 'Set git quickfix list' })
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle current line blame' })
    map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Toggle word diff' })
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'Select hunk' })
  end,
}
