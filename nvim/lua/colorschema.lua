require('nightfox').setup({})
local navic = require("nvim-navic")

-- TODO(torikatsu): なんか指定していく https://github.com/nvim-lualine/lualine.nvim#extensions
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
vim.cmd("colorscheme duskfox")

require'nvim-web-devicons'.setup {
  default = true
}
require'colorizer'.setup()

