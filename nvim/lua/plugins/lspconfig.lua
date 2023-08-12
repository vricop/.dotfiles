return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'jose-elias-alvarez/typescript.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.eslint_d,
          null_ls.builtins.formatting.prettier,
          require'typescript.extensions.null-ls.code-actions'
        },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'folke/neodev.nvim' },
    config = function ()
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = true,
      })
    end,
  }
}
