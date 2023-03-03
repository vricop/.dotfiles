return {
  {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    dependencies = {{ 'nvim-tree/nvim-web-devicons' }},
    config = function()
      require 'bufferline'.setup {}
      local map = vim.keymap.set
      -- Remap default (fallback & native) tab mappings
      map(
        'n', '<S-h>', '<Cmd>BufferLineCyclePrev<Cr>',
        { desc = 'Move prev tab' }
      )
      map(
        'n', '<S-l>', '<Cmd>BufferLineCycleNext<Cr>',
        { desc = 'Move next tab' }
      )
    end
  }
}
