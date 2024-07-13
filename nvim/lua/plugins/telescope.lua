return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      local actions = require 'telescope.actions'
      require('telescope').setup {
        defaults = {
          selection_caret = '  ',
          entry_prefix = '   ',
          prompt_prefix = '   ',
          sorting_strategy = 'ascending',
          -- preview = true,
          path_display = {
            'truncate',
            filename_first = {
              reverse_directories = false,
            },
          },
          layout_config = {
            prompt_position = 'top',
            horizontal = {
              height = 0.65,
            },
          },
          mappings = {
            -- macOS special mappings: œ = <M-q>
            i = {
              ['œ'] = actions.smart_send_to_qflist + actions.open_qflist,
              ['K'] = actions.cycle_history_prev,
              ['J'] = actions.cycle_history_next,
            },
            n = {
              ['œ'] = actions.smart_send_to_qflist + actions.open_qflist,
              ['K'] = actions.cycle_history_prev,
              ['J'] = actions.cycle_history_next,
            },
          },
        },
        pickers = {
          find_files = {
            -- no_ignore = true,
            hidden = true,
          },
          live_grep = {
            prompt_prefix = ' 󰑑  ',
            -- theme = 'ivy',
          },
          grep_string = {
            prompt_prefix = '   ',
          },
          keymaps = {
            prompt_prefix = ' 󰥻  ',
          },
          marks = {
            prompt_prefix = ' 󰃀  ',
          },
          oldfiles = {
            prompt_title = 'Recent files',
            prompt_prefix = '   ',
          },
          git_branches = {
            prompt_prefix = ' 󰘬  ',
            initial_mode = 'normal',
          },
          git_commits = {
            prompt_prefix = ' 󰜘  ',
            initial_mode = 'normal',
          },
          git_status = {
            prompt_prefix = '   ',
            initial_mode = 'normal',
          },
          git_stash = {
            prompt_prefix = '   ',
            initial_mode = 'normal',
          },
          diagnostics = {
            prompt_prefix = '   ',
            initial_mode = 'normal',
          },
          heps_tags = {
            prompt_prefix = ' 󰋖 ',
            initial_mode = 'normal',
          },
        },
      }

      -- Custom theme
      local catppuccin_ok, colors =
        pcall(require, 'catppuccin.palettes')

      if catppuccin_ok then
        colors = colors.get_palette()

        local TelescopeColor = {
          TelescopeMatching = { fg = colors.flamingo },
          TelescopeSelection = {
            fg = colors.text,
            bg = colors.surface0,
            bold = true,
          },

          TelescopePromptPrefix = { bg = colors.surface0 },
          TelescopePromptNormal = { bg = colors.surface0 },
          TelescopeResultsNormal = { bg = colors.mantle },
          TelescopePreviewNormal = { bg = colors.mantle },
          TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
          TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
          TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
          TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
          TelescopeResultsTitle = { fg = colors.mantle },
          TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
        }

        for hl, col in pairs(TelescopeColor) do
          vim.api.nvim_set_hl(0, hl, col)
        end
      end
    end,
    keys = function()
      local builtin = require 'telescope.builtin'

      return {
        { '<Leader>ff', builtin.find_files, desc = 'Find files' },
        { '<Leader>fr', builtin.oldfiles, desc = 'Find recent files' },
        { '<Leader>fk', builtin.keymaps, desc = 'Find keymaps' },
        { '<Leader>fR', builtin.registers, desc = 'Find registers' },
        { '<Leader>fm', builtin.marks, desc = 'Find marks' },
        {
          '<Leader>fw',
          builtin.grep_string,
          desc = 'Find word under cursor',
        },
        { '<Leader>ft', builtin.live_grep, desc = 'Find text in project' },
        { '<Leader>fb', builtin.buffers, desc = 'Find buffers' },
        { '<Leader>fgb', builtin.git_branches, desc = 'Find git branches' },
        { '<Leader>fgc', builtin.git_commits, desc = 'Find git commits' },
        { '<Leader>fgs', builtin.git_status, desc = 'Find git status' },
        { '<Leader>fgS', builtin.git_stash, desc = 'Find git stash' },
        { '<Leader>fd', builtin.diagnostics, desc = 'Find diagnostics' },
        { '<Leader>fh', builtin.help_tags, desc = 'Find helps tags' },
      }
    end,
  },
}
