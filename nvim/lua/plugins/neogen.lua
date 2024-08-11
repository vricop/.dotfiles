return {
  'danymat/neogen',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  enabled = enable_plugins.neogen,
  config = true,
  init = function()
    require('which-key').add { '<Leader>n', group = 'Neogen' }
  end,
  opts = {
    enabled = true,
    input_after_comment = true,
  },
  keys = {
    {
      mode = { 'n', 'v' },
      '<Leader>nf',
      function()
        require('neogen').generate { type = 'func' }
      end,
      desc = 'Function annotation',
    },
    {
      mode = { 'n', 'v' },
      '<Leader>nc',
      function()
        require('neogen').generate { type = 'class' }
      end,
      desc = 'Class annotation',
    },
    {
      mode = { 'n', 'v' },
      '<Leader>nt',
      function()
        require('neogen').generate { type = 'type' }
      end,
      desc = 'Class annotation',
    },
    {
      mode = 'i',
      '<C-l>',
      function()
        require('neogen').jump_next()
      end,
      desc = 'Cycle previous cursor spot',
    },
    {
      mode = 'i',
      '<C-h>',
      function()
        require('neogen').jump_prev()
      end,
      desc = 'Cycle next cursor spot',
    },
  },
}
