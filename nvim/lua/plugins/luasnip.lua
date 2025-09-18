vim.pack.add({ "https://github.com/L3MON4D3/LuaSnip" })

local ls = require("luasnip")
local map = vim.keymap.set

ls.setup({
	enable_autosnippets = true,
	history = true,
	update_events = "TextChanged,TextChangedI",
	region_check_events = "InsertEnter",
	delete_check_events = "TextChanged,InsertLeave",
})

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

-- Expand or jump
map({ "i", "s" }, "<C-j>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true, desc = "LuaSnip expand or jump" })

-- Jump backward
map({ "i", "s" }, "<C-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true, desc = "LuaSnip jump backward" })

-- Cycle through choice nodes (if any)
map({ "i", "s" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true, desc = "LuaSnip next choice" })
