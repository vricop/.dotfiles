local luasnip = require 'luasnip'
local map = vim.keymap.set
local types = require 'luasnip.util.types'

require 'luasnip.loaders.from_lua'.load {
  paths = './lua/snippets/'
}

require 'luasnip.config'.set_config {
  history = true,
  update_events = 'TextChanged, TextChangedI',
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {{ '  Current choice', '@field' }}
      }
    }
  }
}

map( { 'i', 's' }, '<C-j>', function ()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true, desc = 'Expand snippet / Next stop' })

map( { 'i', 's' }, '<C-k>', function ()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true, desc = 'Prev stop' })

map('i', '<C-l>', function ()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, { silent = true, desc = 'Next choice' })

