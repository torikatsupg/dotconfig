local M = {}
M.config_treesitter = function()
  require('nvim-treesitter.configs').setup({})
end

M.config_luasnip = function ()
  local ls = require("luasnip")
  -- some shorthands...
  local snip = ls.snippet
  local node = ls.snippet_node
  local text = ls.text_node
  local insert = ls.insert_node
  local func = ls.function_node
  local choice = ls.choice_node
  local dynamicn = ls.dynamic_node
  
  local date = function() return {os.date('%Y-%m-%d')} end
  
  ls.add_snippets(nil, {
      all = {
          snip({
              trig = "datedatedate",
              namr = "Date",
              dscr = "Date in the form of YYYY-MM-DD",
          }, {
              func(date, {}),
          }),
      },
  })
end

return M
