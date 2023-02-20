return {
  {
    'williamboman/mason.nvim',
    config = function ()
      require('mason').setup {}
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function ()
      require('mason-lspconfig').setup {
        ensure_installed = {
          "bashls",
          "cssls",
          "cssmodules_ls",
          -- "denols",
          "dotls",
          "emmet_ls",
          "eslint",
          "html",
          "jsonls",
          "lua_ls",
          "marksman",
          "rust_analyzer",
          "tsserver",
        },
      }
    end
  }
}
