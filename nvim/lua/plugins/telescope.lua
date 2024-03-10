return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          selection_caret = " ",
          prompt_prefix = "   ",
          sorting_strategy = "ascending",
          preview = false,
          path_display = { "truncate" },
          layout_config = {
            prompt_position = "top",
            horizontal = {
              width = 0.5,
              height = 0.4,
            },
          },
          mappings = {
            -- macOS special mappings: œ = <M-q>
            i = { ["œ"] = actions.smart_send_to_qflist + actions.open_qflist },
            n = { ["œ"] = actions.smart_send_to_qflist + actions.open_qflist },
          },
        },
        pickers = {
          find_files = {
            -- no_ignore = true,
            hidden = true
          },
          live_grep = {
            prompt_prefix = " 󰑑 ",
          },
          grep_string = {
            prompt_prefix = "   ",
          },
          keymaps = {
            prompt_prefix = " 󰌌  ",
          },
          marks = {
            prompt_prefix = " 󰃀 ",
          },
          oldfiles = {
            prompt_title = "Recent files",
            prompt_prefix = "   ",
          },
          git_branches = {
            prompt_prefix = " 󰘬 ",
            initial_mode = "normal",
          },
          git_commits = {
            prompt_prefix = " 󰜘 ",
            initial_mode = "normal",
          },
          buffers = {
            initial_mode = "normal",
          },
        }
      })
    end,
    keys = function()
      local builtin = require("telescope.builtin")

      return {
        { "<Leader>ff",  builtin.find_files,   desc = "Find Files" },
        { "<Leader>fr",  builtin.oldfiles,     desc = "Find Recent Files" },
        { "<Leader>fk",  builtin.keymaps,      desc = "Find Keymaps" },
        { '<Leader>f"',  builtin.registers,    desc = "Find Registers" },
        { "<Leader>f`",  builtin.marks,        desc = "Find Marks" },
        { "<Leader>fw",  builtin.grep_string,  desc = "Find Word Under Cursor" },
        { "<Leader>ft",  builtin.live_grep,    desc = "Find Text In Project" },
        { "<Leader>fb",  builtin.buffers,      desc = "Find buffers" },
        { "<Leader>fgb", builtin.git_branches, desc = "Find git branches" },
        { "<Leader>fgc", builtin.git_commits,  desc = "Find git commits" },
      }
    end
  },
}
