return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require 'telescope'.setup {
        defaults = {
          prompt_prefix = '   '
        },
        pickers = {
          find_files = {
            mappings = {
              i = {
                ['<Cr>'] = 'select_tab',
              },
            },
          },
        },
      }
    end,
  },
}
