local M = {}
local treesitter = require '_treesitter.plugins'

M.indent_blankline = {
  'lukas-reineke/indent-blankline.nvim',
  opt = true,
  event = 'BufRead',
  config = function() require '_indent_blankline.config'.indent_blankline() end,
  requires = treesitter.nightfox,
  wants = treesitter.nightfox.name,
}
return M
