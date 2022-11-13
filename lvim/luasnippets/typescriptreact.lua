require "luasnip".config.set_config {
  history = true,
  update_events = "TextChanged,TextChangedI"
}

return {
  s("us", fmt([[
    const [{}, set{}] = useState{}({})
  ]], {
    i(1, "state"),
    f(function(args)
      return args[1][1]:gsub("^%l", string.upper)
    end, { 1 }),
    i(0),
    i(2, "'defaultState'")
  })),
  s("um", fmt([[
    const {} = useMemo{}({}) 
  ]], {
    i(1, "_"),
    i(0),
    i(2, "() => _, []")
  })),
  s("ur", fmt([[
    const {} = useRef{}({})
  ]], {
    i(1, "refName"),
    i(0),
    i(2, "defaultValue")
  })),
  s("ue", fmt([[
    useEffect{}(() => {{
      {}
    }}, {})
  ]], {
    i(0),
    i(1),
    i(2, "[]")
  })),
  s("obj", fmt([[
    const {} = {{
      {}
    }}
  ]], {
    i(1, "objectName"),
    i(2)
  })),
  s("dir", fmt("console.dir({})", {
    i(1, "_")
  })),
  s("table", fmt("console.table({})", {
    i(1, "_")
  })),
  s("log", fmt("console.log({})", {
    i(1, "_")
  })),
  s("afc", fmt([[
    const {} = ({}) => {{
      return ({})
    }}
  ]], {
    i(1, "ComponentName"),
    i(2, "props"),
    i(3)
  })),
  s("fc", fmt([[
    function {}({}) {{
      return ({})
    }}
  ]], {
    i(1, "ComponentName"),
    i(2, "props"),
    i(3)
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
