return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = {
      layout = {
        preset = 'ivy',
        cycle = true,
      },
      formatters = {
        file = {
          filename_first = true,
        },
      },
    },
    input = { enabled = true },
  },
  keys = {
    -- Top Pickers & Explorer
    {
      '<leader><space>',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.smart()
      end,
      desc = 'Smart Find Files',
    },
    {
      '<leader>,',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader>/',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>:',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>n',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.notifications()
      end,
      desc = 'Notification History',
    },
    {
      '<leader>e',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.explorer {
          win = {
            list = {
              keys = {
                ['z'] = 'explorer_close_all',
                [']c'] = 'explorer_git_next',
                ['[c'] = 'explorer_git_prev',
              },
            },
          },
        }
      end,
      desc = 'File Explorer',
    },
    -- find
    {
      '<leader>fb',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader>fc',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Find Config File',
    },
    {
      '<leader>ff',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.files()
      end,
      desc = 'Find Files',
    },
    {
      '<leader>fg',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.git_files()
      end,
      desc = 'Find Git Files',
    },
    {
      '<leader>fp',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.projects()
      end,
      desc = 'Projects',
    },
    {
      '<leader>fr',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.recent()
      end,
      desc = 'Recent',
    },
    -- git
    {
      '<leader>gb',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.git_branches()
      end,
      desc = 'Git Branches',
    },
    {
      '<leader>gl',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.git_log()
      end,
      desc = 'Git Log',
    },
    {
      '<leader>gL',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.git_log_line()
      end,
      desc = 'Git Log Line',
    },
    {
      '<leader>gs',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.git_status()
      end,
      desc = 'Git Status',
    },
    {
      '<leader>gS',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.git_stash()
      end,
      desc = 'Git Stash',
    },
    {
      '<leader>gd',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.git_diff()
      end,
      desc = 'Git Diff (Hunks)',
    },
    {
      '<leader>gf',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.git_log_file()
      end,
      desc = 'Git Log File',
    },
    -- Grep
    {
      '<leader>sb',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.lines()
      end,
      desc = 'Buffer Lines',
    },
    {
      '<leader>sB',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.grep_buffers()
      end,
      desc = 'Grep Open Buffers',
    },
    {
      '<leader>sg',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>sw',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.grep_word()
      end,
      desc = 'Visual selection or word',
      mode = { 'n', 'x' },
    },
    -- search
    {
      '<leader>s"',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.registers()
      end,
      desc = 'Registers',
    },
    {
      '<leader>s/',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.search_history()
      end,
      desc = 'Search History',
    },
    {
      '<leader>sa',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.autocmds()
      end,
      desc = 'Autocmds',
    },
    {
      '<leader>sb',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.lines()
      end,
      desc = 'Buffer Lines',
    },
    {
      '<leader>sc',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>sC',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.commands()
      end,
      desc = 'Commands',
    },
    {
      '<leader>sd',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>sD',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.diagnostics_buffer()
      end,
      desc = 'Buffer Diagnostics',
    },
    {
      '<leader>sh',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.help()
      end,
      desc = 'Help Pages',
    },
    {
      '<leader>sH',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.highlights()
      end,
      desc = 'Highlights',
    },
    {
      '<leader>si',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.icons()
      end,
      desc = 'Icons',
    },
    {
      '<leader>sj',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.jumps()
      end,
      desc = 'Jumps',
    },
    {
      '<leader>sk',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.keymaps()
      end,
      desc = 'Keymaps',
    },
    {
      '<leader>sl',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.loclist()
      end,
      desc = 'Location List',
    },
    {
      '<leader>sm',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.marks()
      end,
      desc = 'Marks',
    },
    {
      '<leader>sM',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.man()
      end,
      desc = 'Man Pages',
    },
    {
      '<leader>sp',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.lazy()
      end,
      desc = 'Search for Plugin Spec',
    },
    {
      '<leader>sq',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.qflist()
      end,
      desc = 'Quickfix List',
    },
    {
      '<leader>sR',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.resume()
      end,
      desc = 'Resume',
    },
    {
      '<leader>su',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.undo()
      end,
      desc = 'Undo History',
    },
    {
      '<leader>uC',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.colorschemes()
      end,
      desc = 'Colorschemes',
    },
    -- LSP
    {
      'gd',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Goto Definition',
    },
    {
      'gD',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.lsp_declarations()
      end,
      desc = 'Goto Declaration',
    },
    {
      'gr',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = 'References',
    },
    {
      'gI',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.lsp_implementations()
      end,
      desc = 'Goto Implementation',
    },
    {
      'gy',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'Goto T[y]pe Definition',
    },
    {
      '<leader>ss',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.lsp_symbols()
      end,
      desc = 'LSP Symbols',
    },
    {
      '<leader>sS',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = 'LSP Workspace Symbols',
    },
    -- Other
    {
      '<leader>.',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      '<leader>S',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.scratch.select()
      end,
      desc = 'Select Scratch Buffer',
    },
    {
      '<leader>n',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.notifier.show_history()
      end,
      desc = 'Notification History',
    },
    {
      '<leader>bd',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.bufdelete()
      end,
      desc = 'Delete Buffer',
    },
    {
      '<leader>cR',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.rename.rename_file()
      end,
      desc = 'Rename File',
    },
    {
      '<leader>gB',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
      mode = { 'n', 'v' },
    },
    {
      '<leader>gg',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.lazygit {
          win = {
            width = vim.o.columns,
            height = vim.o.lines,
          },
        }
      end,
      desc = 'LazyGit (Fullscreen)',
    },
    {
      '<leader>un',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss All Notifications',
    },
    {
      '<c-/>',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
    {
      '<c-_>',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.terminal()
      end,
      desc = 'which_key_ignore',
    },
    {
      ']]',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.words.jump(vim.v.count1)
      end,
      desc = 'Next Reference',
      mode = { 'n', 't' },
    },
    {
      '[[',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = 'Prev Reference',
      mode = { 'n', 't' },
    },
    {
      '<leader>N',
      desc = 'Neovim News',
      function()
        ---@diagnostic disable: undefined-global
        Snacks.win {
          file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = 'yes',
            statuscolumn = ' ',
            conceallevel = 3,
          },
        }
      end,
    },
  },
}
