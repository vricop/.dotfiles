-- Set cmdheight to 1 when entering command mode
vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = "*",
  callback = function()
    vim.o.cmdheight = 1
  end,
})

-- Set cmdheight back to 0 when leaving command mode
vim.api.nvim_create_autocmd("CmdlineLeave", {
  pattern = "*",
  callback = function()
    vim.o.cmdheight = 0
  end,
})
