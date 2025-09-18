---@diagnostic disable: undefined-global

return {
	s("log", fmt("console.log({})", { i(1) })),
	s("dir", fmt("console.dir({})", { i(1) })),
	s("us", fmt("const [{}, {}] = useState({})", { i(1), i(2), i(3) })),
	s("ur", fmt("const {} = useRef({})", { i(1), i(2) })),
	s(
		"ue",
		fmt(
			[[
        useEffect(() => {{
          {}
        }}, [{}])
      ]],
			{ i(1), i(2) }
		)
	),
	s(
		"um",
		fmt(
			[[
        const {} = useMemo(
          () => {},
          [{}]
        )
      ]],
			{ i(1), i(2), i(3) }
		)
	),
	s(
		"comp",
		fmta(
			[[
        export default function <>(<>:<>Props) {
          return <>
        }
      ]],
			{
				i(1, "Name"),
				i(2, "{ children }"),
				rep(1),
				i(3, "null"),
			}
		)
	),
}
