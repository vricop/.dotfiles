return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')

    conform.setup({
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
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })
  end,
  keys = {
    lhs = '<Leader>=',
    rhs = function()
      require('conform').format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end,
    mode = { 'n', 'v' },
    desc = 'Format file or range (in visual mode)',
  },
}
