local group = vim.api.nvim_create_augroup("EnvVariableTypes", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { ".env.*" },
  group = group,
  callback = function()
    vim.bo.filetype = "bash"
  end
})
