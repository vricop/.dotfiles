local group = vim.api.nvim_create_augroup("KeymapFileType", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.keymap" },
  group = group,
  callback = function()
    vim.bo.filetype = "dts"
  end
})
