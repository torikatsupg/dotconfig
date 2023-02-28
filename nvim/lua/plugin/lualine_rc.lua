-- TODO(torikatsu): なんか指定していく https://github.com/nvim-lualine/lualine.nvim#extensions
return function()
  local navic = require("nvim-navic")
  require('lualine').setup {
    options = {
      theme = 'duskfox',
      always_divide_middle = true,
      globalstatus = false,
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 }, },
      lualine_c = { { navic.get_location } },
      lualine_x = { 'encoding', 'fileformat' },
      lualine_y = { 'filetype', 'progress' },
      lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 }, }
    },
    winbar = {
      lualine_a = { { 'filename', file_status = true, path = 1 } },
    },
    inactive_winbar = {
      lualine_a = { { 'filename', file_status = true, path = 1 } },
    },
  }
end
