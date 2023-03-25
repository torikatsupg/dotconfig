local M = {}
M.builtin = function(name)
  return function()
    return require("telescope.builtin")[name]({})
  end
end

M.extensions = function(name, prop)
  return function()
    local telescope = require "telescope"
    telescope.load_extension(name)
    return telescope.extensions[name][prop]({})
  end
end

return M
