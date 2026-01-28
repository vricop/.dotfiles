return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = false,
  config = function()
    require('render-markdown').setup()
    vim.keymap.set('n', '<Leader>tm', ':RenderMarkdown toggle<Cr>', { desc = 'Toggle markdown rendering' })
  end,
}
