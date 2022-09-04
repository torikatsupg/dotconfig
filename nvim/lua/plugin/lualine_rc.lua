-- TODO(torikatsu): なんか指定していく https://github.com/nvim-lualine/lualine.nvim#extensions
return function()
  local navic = require("nvim-navic")
  require('lualine').setup{
    options = {
      theme = 'duskfox',
      always_divide_middle = true,
      globalstatus = false
    },
    tabline = {
      lualine_c = {
        { navic.get_location, cond = navic.is_available },
      }
    }
  }
end
