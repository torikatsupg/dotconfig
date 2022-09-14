return function()
  local telescope = require 'telescope'
  telescope.setup {
    pickers = {
      find_files = {
        theme = "dropdown",
      }
    },
  }

  telescope.load_extension('fzf')
  telescope.load_extension("frecency")
end
