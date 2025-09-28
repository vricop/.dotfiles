vim.pack.add({ "https://github.com/saghen/blink.cmp" })

require("blink.cmp").setup({
  fuzzy = {
    implementation = "lua",
  },
})
