return {
  {
    'echasnovski/mini.surround',
    opts = {},
  },
  {
    'echasnovski/mini.ai',
    opts = {
      custom_textobjects = {
        ---NOTE: Disable **tag** text objects, won't work in TSX
        ---@source: https://github.com/echasnovski/mini.nvim/issues/865 
        t = false
      },
    },
  },
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    opts = {
      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { 'string' },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    },
  },
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    opts = {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring()
            or vim.bo.commentstring
        end,
      },
    },
  },
  {
    'echasnovski/mini.files',
    opts = {},
    keys = {
      {
        '<leader>E',
        function()
          ---@diagnostic disable: undefined-global
          if not MiniFiles.close() then
            MiniFiles.open(vim.api.nvim_buf_get_name(0))
          end
        end,
        desc = 'Open mini files',
      },
    },
  },

  {
    'echasnovski/mini.indentscope',
    opts = {},
  },
  {
    'echasnovski/mini.pick',
    opts = {},
  },
}
