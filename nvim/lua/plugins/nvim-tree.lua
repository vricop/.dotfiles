  return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {{ 'nvim-tree/nvim-web-devicons' }},
    config = function()
      require('nvim-tree').setup({
        view = {
          mappings = {
            custom_only = false,
            list = {
              { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
              { key = "h", action = "close_node" },
              { key = "v", action = "vsplit" },
              { key = "C", action = "cd" },
            },
          },
        },
        renderer = {
          icons = {
            git_placement = "after",
            padding = " ",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
              modified = true,
            },
            -- Update broken icons after nerdfont patch is updated for PragmataPro
            glyphs = {
              default = "",
              symlink = "",
              bookmark = "",
              modified = "●",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "ﱮ",
                empty = "",
                empty_open = "ﱮ",
                symlink = "",
                symlink_open = "ﱮ",
              },
              git = {
                unstaged = "●",
                staged = "",
                unmerged = "",
                renamed = "R",
                untracked = "U",
                deleted = "D",
                ignored = "I",
              },
            },
          },
        },
      live_filter = {
        prefix = "FILTER: ",
      },
    })

    vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<Cr>', {
      desc = 'Toggle explorer',
      silent = true
    })
  end
  }
}
