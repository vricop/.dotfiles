return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require 'gitsigns'

      gitsigns.setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "Go to next change" })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "Go to previous change" })

          -- Actions
          map({ 'n', 'v' }, '<Leader>gs', ':Gitsigns stage_hunk<CR>', { desc = 'Stage hunk' })
          map({ 'n', 'v' }, '<Leader>gr', ':Gitsigns reset_hunk<CR>', { desc = 'Reset hunk' })
          map('n', '<Leader>gS', gs.stage_buffer, { desc = 'Stage buffer' })
          map('n', '<Leader>gu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
          map('n', '<Leader>gR', gs.reset_buffer, { desc = 'Reset buffer' })
          map('n', '<Leader>gp', gs.preview_hunk, { desc = 'Preview hunk' })
          map('n', '<Leader>gb', function() gs.blame_line { full = true } end, { desc = 'Blame line' })
          map('n', '<Leader>gd', gs.diffthis, { desc = 'Diff this' })
          map('n', '<Leader>gD', function() gs.diffthis('~') end, { desc = 'Diff last commit?' })
          map('n', '<Leader>gtd', gs.toggle_deleted, { desc = 'Toggle deleted' })
          map('n', '<Leader>gtb', gs.toggle_current_line_blame, { desc = 'Toggle current line blame' })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Inside hunk" })
        end
      }
    end,
  }
}
