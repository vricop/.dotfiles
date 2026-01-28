local env_group = vim.api.nvim_create_augroup("EnvFiletype", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = env_group,
  pattern = { ".env", ".env.*" },
  callback = function()
    vim.bo.filetype = "conf"
  end,
})

---Close term after pressing `q` `esc` or `Ctrl-c`
local function auto_close_term(cmd_pattern)
  vim.api.nvim_create_autocmd("TermClose", {
    pattern = cmd_pattern,
    callback = function(args)
      vim.schedule(function()
        vim.api.nvim_buf_delete(args.buf, { force = true })
      end)
    end,
  })
end

auto_close_term("*opencode*")
auto_close_term("*lazygit*")
auto_close_term("*serpl*")
