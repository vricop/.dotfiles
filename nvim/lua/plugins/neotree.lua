return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  enabled = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  keys = {
    {
      '<Leader>e',
      ':Neotree toggle<Cr>',
      desc = 'Open Neotree',
      noremap = true,
      silent = true,
    },
    {
      '<Leader>E',
      ':Neotree focus<Cr>',
      desc = 'Focus Neotree',
      noremap = true,
      silent = true,
    },
  },
  config = function()
    require('neo-tree').setup {
      window = {
        mappings = {
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['<Space>'] = 'none',
        },
      },
      filesystem = {
        window = {
          mappings = {
            ['[c'] = 'prev_git_modified',
            [']c'] = 'next_git_modified',
          },
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = '󰐕 ',
            deleted = '󰍴 ',
            modified = ' ',
            renamed = 'R',
            -- Status type
            untracked = '?',
            ignored = ' ',
            unstaged = '',
            staged = '',
            conflict = ' ',
          },
        },
      },
      source_selector = {
        winbar = true, -- toggle to show selector on winbar
      },
    }
  end,
}
