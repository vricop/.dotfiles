return {
  {
    'nvim-pack/nvim-spectre',
    dependencies = {
      { 'nvim-lua/plenary.nvim' }
    },
    keys = {
      {
        '<leader>R',
        '<cmd>lua require("spectre").toggle()<CR>',
        desc = "Toggle Spectre"
      },
      {
        '<leader>rw',
        '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
        desc = "Search current word"
      },
      {
        '<leader>rw',
        '<esc><Cmd>lua require("spectre").open_visual()<CR>',
        mode= "v",
        desc = "Search current word"
      },
      {
        '<leader>sf',
        '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
        desc = "Search on current file"
      }
    }
  }
}
