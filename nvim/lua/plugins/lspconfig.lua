return {
  { 
    'neovim/nvim-lspconfig',
    config = function ()
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = true,
      })
    end
  }
}
