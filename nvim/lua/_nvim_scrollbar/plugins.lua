local M = {}

M.nvim_scrollbar = {
  'petertriho/nvim-scrollbar',
  config = function() require '_nvim_scrollbar.config'.config_nvim_scrollbar() end,
  opt = true,
  event = 'BufRead',
  requires = {
    'kevinhwang91/nvim-hlslens',
    opt = true,
    config = function() require '_nvim_scrollbar.config'.config_hlslens() end,
  },
  wants = 'nvim-hlslens',
}

return M
