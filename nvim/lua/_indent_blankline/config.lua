local M = {}

M.indent_blankline = function()
  require("ibl").setup {
    scope = { enabled = true },
  }
end

return M

