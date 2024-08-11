return {
  'lewis6991/gitsigns.nvim',
  enabled = enable_plugins.gitsigns,
  config = function()
    local gitsigns = require 'gitsigns'

    gitsigns.setup {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function keymap(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        keymap('n', ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Go to next change' })

        keymap('n', '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Go to previous change' })

        -- Actions
        keymap({ 'n', 'v' }, '<Leader>gs', ':Gitsigns stage_hunk<CR>', {
          desc = 'Stage hunk',
        })

        keymap({ 'n', 'v' }, '<Leader>gr', ':Gitsigns reset_hunk<CR>', {
          desc = 'Reset hunk',
        })

        keymap('n', '<Leader>gS', gs.stage_buffer, {
          desc = 'Stage buffer',
        })

        keymap('n', '<Leader>gu', gs.undo_stage_hunk, {
          desc = 'Undo stage hunk',
        })

        keymap('n', '<Leader>gR', gs.reset_buffer, {
          desc = 'Reset buffer',
        })

        keymap('n', '<Leader>gp', gs.preview_hunk, {
          desc = 'Preview hunk',
        })

        keymap('n', '<Leader>gb', function()
          gs.blame_line { full = true }
        end, {
          desc = 'Blame line',
        })

        keymap('n', '<Leader>gd', gs.diffthis, {
          desc = 'Diff this',
        })

        keymap('n', '<Leader>gD', function()
          gs.diffthis '~'
        end, {
          desc = 'Diff last commit?',
        })

        keymap('n', '<Leader>gtd', gs.toggle_deleted, {
          desc = 'Toggle deleted',
        })

        keymap('n', '<Leader>gtb', gs.toggle_current_line_blame, {
          desc = 'Toggle current line blame',
        })

        -- Text object
        keymap({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {
          desc = 'Inside hunk',
          silent = true,
        })
      end,
    }
  end,
}
