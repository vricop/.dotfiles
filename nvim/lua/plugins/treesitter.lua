return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "javascript", "typescript", "tsx", "css", "html", "lua", "rust"
        },
        auto_install = true,
        sync_install = false,
        highlight = { enable = true }
      })
    end
  }
}
