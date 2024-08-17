return {
  'mfussenegger/nvim-lint',
  events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
  enabled = enable_plugins.linting,
  opts = {
    linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      svelte = { 'eslint_d' },
    },
  },
  keys = {
    {
      '<Leader>ll',
      function()
        require('lint').try_lint()
      end,
      desc = 'Trigger linting for current file',
    },
  },
}
