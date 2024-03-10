return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'jose-elias-alvarez/typescript.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          -- null_ls.builtins.formatting.eslint_d,
          null_ls.builtins.formatting.prettier,
          require 'typescript.extensions.null-ls.code-actions'
        },
      }
    end,
  }
}
