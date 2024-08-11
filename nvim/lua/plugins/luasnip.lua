local luasnip = require 'luasnip'

return {
  'L3MON4D3/LuaSnip',
  build = 'make install_jsregexp',
  enabled = enable_plugins.luasnip,
  config = function()
    local types = require 'luasnip.util.types'

    require('luasnip.loaders.from_vscode').lazy_load {
      paths = { './lua/snippets' },
      fs_event_providers = { libuv = true },
    }

    require('luasnip.config').set_config {
      history = true,
      update_events = 'TextChanged, TextChangedI',
      enable_autosnippets = true,
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { ' Current choice', '@field' } },
          },
        },
      },
    }
  end,
  keys = {
    {
      '<C-j>',
      function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end,
      mode = { 'i', 's' },
      desc = 'Expand snippet / Next stop',
    },
    {
      '<C-k>',
      function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end,
      mode = { 'i', 's' },
      desc = 'Prev stop',
    },
    {
      '<C-l>',
      function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end,
      mode = 'i',
      desc = 'Next choice',
    },
  },
}
