return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  enabled = enable_plugins.treesitter,
  main = 'nvim-treesitter.configs',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'css',
      'devicetree',
      'diff',
      'gitignore',
      'html',
      'javascript',
      'jsdoc',
      'lua',
      'luadoc',
      'markdown',
      'rust',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'yaml',
    },
    -- Improves indent formatting for the `=` command
    indent = { enable = true },
    highlight = { enable = true },
    auto_install = true,
    sync_install = false,
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-space>',
        node_incremental = '<C-space>',
        scope_incremental = false,
        node_decremental = '<bs>',
      },
    },
  },
}
