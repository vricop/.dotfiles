return {
  {
    'echasnovski/mini.surround',
    version = '*',
    enabled = enable_plugins['mini.surround'],
    opts = {},
  },
  {
    'echasnovski/mini.ai',
    enabled = enable_plugins['mini.ai'],
    version = '*',
    opts = {},
  },
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    enabled = enable_plugins['mini.pairs'],
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
    enable_plugins = enable_plugins['mini.comment'],
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
    enabled = enable_plugins['mini.files'],
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
      },
    },
  },
}
