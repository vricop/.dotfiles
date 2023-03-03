return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { "jose-elias-alvarez/typescript.nvim" },
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
