vim.pack.add({ "https://github.com/vinnymeller/swagger-preview.nvim" })

require("swagger-preview").setup({
  port = 8000,
  host = "localhost"
})
