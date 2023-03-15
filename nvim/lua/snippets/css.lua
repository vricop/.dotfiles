local ls = require("luasnip")
local t = ls.text_node
local s = ls.snippet
local c = ls.choice_node
local i = ls.insert_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local sn = ls.snippet_node
-- local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		"media",
		fmt([[
    @mixin {} {{
      {}
    }}]],
			{
				c(1, {
					t("mediaMin640"),
					t("mediaMin768"),
					t("mediaMin1024"),
					t("mediaMin1280"),
					t("mediaMax768"),
					t("mediaMax1024"),
				}),
        i(2)
			}
		)
	),
}
