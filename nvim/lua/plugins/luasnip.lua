local luasnip = require("luasnip")

return {
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		config = function()
			local types = require("luasnip.util.types")

			require("luasnip.loaders.from_lua").load({
				paths = { "./lua/snippets/" },
			})

			require("luasnip.config").set_config({
				history = true,
				update_events = "TextChanged, TextChangedI",
				enable_autosnippets = true,
				ext_opts = {
					[types.choiceNode] = {
						active = {
							virt_text = { { " Current choice", "@field" } },
						},
					},
				},
			})
		end,
		keys = {
			{
				"<C-j>",
				function()
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					end
				end,
				mode = { "i", "s" },
				silent = true,
				desc = "Expand snippet / Next stop",
			},
			{
				"<C-k>",
				function()
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					end
				end,
				mode = { "i", "s" },
				silent = true,
				desc = "Prev stop",
			},
			{
				"<C-l>",
				function()
					if luasnip.choice_active() then
						luasnip.change_choice(1)
					end
				end,
				mode = "i",
				silent = true,
				desc = "Next choice",
			},
		},
	},
}
