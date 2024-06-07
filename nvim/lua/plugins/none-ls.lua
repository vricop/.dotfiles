return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'jose-elias-alvarez/typescript.nvim',
      "nvim-lua/plenary.nvim"
    },
    config = function()
      local null_ls = require 'null-ls'
      local formatting = null_ls.builtins.formatting

      null_ls.setup {
        debug = true,
        sources = {
          formatting.stylua,
          -- formatting.eslint,
          formatting.prettier.with,
          require 'typescript.extensions.null-ls.code-actions'
        },
      }
    end,
  }
}
