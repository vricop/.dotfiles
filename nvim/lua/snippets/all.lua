local ls = require("luasnip")
local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("us",
    fmt([[ const [{}, set{}] = useState({})]], {
      i(1, "state"),
      f(function(args)
        return args[1][1]:gsub("^%l", string.upper)
      end, { 1 }),
      i(2),
    })
  ),
  s("um", fmt([[ const {} = useMemo{}({})]], { i(1), i(2), i(3) })),
  s("ur", fmt([[ const {} = useRef{}({})]], { i(1), i(2), i(3) })),
  s("ue", fmt([[
    useEffect{}(() => {{
      {}
    }}, [{}])]], { i(1), i(2), i(3) })
  ),
  s("ut", fmt([[ const t = useTranslations('{}')]], { i(1) })),
  s("uM", fmt([[ const {} = useMessages({})]], { i(1, 'message'), i(2) })),
  s('log', t 'console.'),
  s("afc",
    fmt([[
      export interface {}Props {{

      }}

      const {} = (props:{}) => {{
        return '{}'
      }}

      export default {}]], {
      d(1, function(_, parent)
        return sn(nil, i(1, parent.snippet.env.TM_FILENAME_BASE))
      end, {}),
      rep(1),
      d(2, function(args) return sn(nil, t(args[1][1] .. 'Props')) end, { 1 }),
      i(3),
      rep(1),
    })
  ),
  s("fc", fmt([[
    export default function {}() {{
      return <h1>{} page</h1>
    }}
  ]], {
    d(1, function(_, parent)
      return sn(nil, i(1, parent.snippet.env.TM_FILENAME_BASE))
    end, {}),
    rep(1)
  })),
  s("pcfr", fmt([[
      import classNames from 'classnames'
      import {{
        forwardRef,
        type ElementType,
        type PropsWithChildren,
        type ReactElement,
      }} from 'react'
      import type {{ PolymorphicComponentPropsWithRef, PolymorphicRef }} from '../../types'
      import style from '{}.module.css'

      export interface {}Props extends PropsWithChildren<unknown> {{

      }}

      type PolymorphicProps<C extends ElementType> =
        PolymorphicComponentPropsWithRef<C, {}Props>

      type PolymorphicComponent = <C extends ElementType = {}>(
        props: PolymorphicProps<C>
      ) => ReactElement | null

      export const {}: PolymorphicComponent = forwardRef(
        <C extends ElementType = {}>(
          {{
            as: Component = 'p',
            ...other
          }}:
          PolymorphicProps<C>,
          ref?: PolymorphicRef<C>
        ) => {{
          return (
            <Component
              {{...other}}
              ref={{ref}}
            >
              {{children}}
            </Component>
          )
        }}
      )
  ]], {
    i(1, "ComponentName"),
    rep(1),
    rep(1),
    i(2, "'span' | 'p'"),
    rep(1),
    rep(2),
  }))
}
