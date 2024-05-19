return {
  'akinsho/bufferline.nvim',
  enabled = true,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  config = function()
    require 'bufferline'.setup({
      options = {
        mode = 'tabs',
      }
    })
    local map = vim.keymap.set

    map(
      'n', '<Leader>b', '<Cmd>BufferLinePick<Cr>',
      { desc = 'Jump to tab' }
    )
  end
}
