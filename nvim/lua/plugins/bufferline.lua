return {
  {
    'akinsho/bufferline.nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    config = function()
      require 'bufferline'.setup()
      local map = vim.keymap.set

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
