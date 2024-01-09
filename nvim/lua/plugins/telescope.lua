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
          path_display = { "tail" },
          layout_config = {
            prompt_position = "top",
          },
          mappings = {
            -- macOS special mappings: œ = <M-q>
            i = { ["œ"] = actions.smart_send_to_qflist + actions.open_qflist },
            n = { ["œ"] = actions.smart_send_to_qflist + actions.open_qflist },
          },
        },
        pickers = {
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
        },
      })
    end,
    keys = {
      { "<Leader>ff",  "<Cmd>Telescope find_files<Cr>",   desc = "Find Files" },
      { "<Leader>fr",  "<Cmd>Telescope oldfiles<Cr>",     desc = "Find Recent Files" },
      { "<Leader>fk",  "<Cmd>Telescope keymaps<Cr>",      desc = "Find Keymaps" },
      { '<Leader>f"',  "<Cmd>Telescope registers<Cr>",    desc = "Find Registers" },
      { "<Leader>f`",  "<Cmd>Telescope marks<Cr>",        desc = "Find Marks" },
      { "<Leader>fw",  "<Cmd>Telescope grep_string<Cr>",  desc = "Find Word Under Cursor" },
      { "<Leader>ft",  "<Cmd>Telescope live_grep<Cr>",    desc = "Find Text In Project" },
      { "<Leader>fb",  "<Cmd>Telescope buffers<Cr>",      desc = "Find buffers" },
      { "<Leader>fgb", "<Cmd>Telescope git_branches<Cr>", desc = "Find git branches" },
      { "<Leader>fgc", "<Cmd>Telescope git_commits<Cr>",  desc = "Find git commits" },
    },
  },
}
