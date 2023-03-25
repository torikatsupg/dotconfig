
local M = {}
  M.nvim_colorizer =  {
    'NvChad/nvim-colorizer.lua',
    commit = 'dde3084106a70b9a79d48f426f6d6fec6fd203f7',
    config = function()
      require 'colorizer'.setup({
        user_default_options = {
          mode = 'virtualtext'
        }
      })
    end,
    opt = true,
    event = { 'BufRead' },
  }
  return M