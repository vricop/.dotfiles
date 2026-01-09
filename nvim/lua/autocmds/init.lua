local env_group = vim.api.nvim_create_augroup("EnvFiletype", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = env_group,
  pattern = { ".env", ".env.*" },
  callback = function()
    vim.bo.filetype = "conf"
  end,
})
