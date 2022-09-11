return function()
  local ls = require("luasnip")
  local s = ls.snippet
  local sn = ls.snippet_node
  local isn = ls.indent_snippet_node
  local t = ls.text_node
  local i = ls.insert_node
  local f = ls.function_node
  local c = ls.choice_node
  local d = ls.dynamic_node
  local r = ls.restore_node

  ls.snippets = {
    all = {
      s({
        trig = 'fn',
        name = 'function',
        dscr = {
          'fn …(…) { … }',
        },
      }, {
        t 'fn ',
        -- function name
        i(1, 'func'),
        t '(',
        -- first method argument
        i(2, 'arg'),
        t ': ',
        -- argument type
        i(3, '&str'),
        t ') -> ',
        -- return type
        i(4, '&str'),
        -- Linebreak
        t { ' {', '\t' },
        i(0, ''),
        t { '', '}' },
      }),
    },
  }
  require("luasnip/loaders/from_vscode").lazy_load()
end
