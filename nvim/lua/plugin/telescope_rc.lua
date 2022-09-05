return function()
  local telescope = require 'telescope'
  telescope.load_extension('fzf')
  telescope.load_extension("frecency")
end
