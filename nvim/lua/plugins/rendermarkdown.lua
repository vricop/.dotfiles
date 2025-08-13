vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })
require("render-markdown").setup()

local map = vim.keymap.set
map("n", "<Leader>tm", ":RenderMarkdown toggle<Cr>", { desc = "Toggle markdown rendering" })
