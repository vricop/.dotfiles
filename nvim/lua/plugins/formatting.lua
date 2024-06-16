local format_opts = {
  lsp_fallback = true,
  async = false,
  timeout_ms = 500,
}

local create_user_command = vim.api.nvim_create_user_command

create_user_command('FormatDisable', function(args)
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
  print 'Format on save disabled'
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
  print 'Format on save enabled'
end, {
  desc = 'Re-enable autoformat-on-save',
})

return {
  'stevearc/conform.nvim',
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        svelte = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        lua = { 'stylua' },
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        return format_opts
      end,
    }

    local keymap = require('core.utils').keymap

    keymap('n', '<Leader>=', function()
      conform.format(format_opts)
    end, { desc = 'Format buffer' })
  end,
}
