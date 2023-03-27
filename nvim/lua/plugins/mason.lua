return {
  {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    config = function ()
      require('mason').setup {}
      require('mason-lspconfig').setup {
        ensure_installed = {
          "bashls",
          "cssls",
          "dotls",
          "emmet_ls",
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
