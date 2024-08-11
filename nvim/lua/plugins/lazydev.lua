return {
  {
    'folke/lazydev.nvim',
    enabled = enable_plugins.lazydev,
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- optional `vim.uv` typings
    'Bilal2453/luvit-meta',
    lazy = true,
    enabled = enable_plugins['luvit-meta'],
  },
  { -- optional completion source for require statements and module annotations
    'hrsh7th/nvim-cmp',
    enabled = enable_plugins.cmp,
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = 'lazydev',
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
}
