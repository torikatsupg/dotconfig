local M = {}

M.indent_blankline =  function()
  require("indent_blankline").setup {
    show_end_of_line = true,
  }
end

return M