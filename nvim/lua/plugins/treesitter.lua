return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  enabled = enable_plugins.treesitter,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  init = function()
    -- Skip backwards compatibility routines and speed up loading.
    vim.g.skip_ts_context_commentstring_module = true
  end,
  config = function()
    local treesitter = require 'nvim-treesitter.configs'

    treesitter.setup {
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
    }

    require('ts_context_commentstring').setup {
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
          -- Languages that have a single comment style
          typescript = '// %s',
          css = '/* %s */',
          scss = '/* %s */',
          html = '<!-- %s -->',
          svelte = '<!-- %s -->',
          vue = '<!-- %s -->',
          json = '',
        },
      },
    }
  end,
}
