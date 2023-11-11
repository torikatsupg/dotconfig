local M = {}
M.nvim_colorizer = {
  'NvChad/nvim-colorizer.lua',
  config = function() require '_colorizer.config'.colorizer() end,
  opt = true,
  event = { 'BufRead' },
}
return M

