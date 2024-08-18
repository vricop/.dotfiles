return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  enabled = enable_plugins['neo-tree'],
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  keys = {
    {
      '<Leader>e',
      function()
        require('neo-tree.command').execute {
          toggle = true,
          position = 'left',
        }
      end,
      desc = 'Explorer NeoTree (Root Dir)',
    },
    {
      '<Leader><Space>',
      function()
        require('neo-tree.command').execute { focus = true }
      end,
      desc = 'Focus Neotree',
    },
  },
  opts = {
    sources = { 'filesystem', 'buffers', 'git_status' },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      window = {
        mappings = {
          ['[c'] = 'prev_git_modified',
          [']c'] = 'next_git_modified',
          ['l'] = 'open',
          ['h'] = 'close_node',
        },
      },
    },
    window = {
      position = 'left',
      width = 40,
      auto_expand_width = false,
      mappings = {
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['<space>'] = 'none',
      },
    },
    default_component_configs = {
      icon = {
        folder_closed = '󰉋 ',
        folder_open = '󰝰 ',
        folder_empty = '󰉖 ',
      },
      git_status = {
        symbols = {
          -- Change type
          added = ' ',
          deleted = ' ',
          modified = ' ',
          renamed = ' ',
          -- Status type
          untracked = '󰋱 ',
          ignored = ' ',
          unstaged = 'U',
          staged = 'S',
          conflict = ' ',
        },
      },
    },
    source_selector = {
      winbar = true,
    },
  },
}
