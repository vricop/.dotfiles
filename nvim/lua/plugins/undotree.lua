return {
  'mbbill/undotree',
  enabled = enable_plugins.undotree,
  keys = {
    {
      '<Leader>tu',
      ':UndotreeToggle<Cr>',
      desc = 'Toggle undotree',
      silent = true,
    },
  },
}
