local M = {}
local rc = require 'nvim_scrollbar.rc'

M.nvim_scrollbar =  {
  'petertriho/nvim-scrollbar',
  config = rc.config_nvim_scrollbar,
  requires = {
    'kevinhwang91/nvim-hlslens',
    config = rc.config_hlslens,
  },
  wants = { 'nvim-hlslens' },
  opt = true,
  event = { 'BufRead' }
}

return M