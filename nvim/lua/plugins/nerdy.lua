return {
  '2kabhishek/nerdy.nvim',
  enabled = enable_plugins.nerdy,
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-telescope/telescope.nvim',
  },
  cmd = 'Nerdy',
  keys = {
    { '<Leader>f,', ':Nerdy<Cr>', desc = 'Open nerdy finder', silent = true },
  },
}
