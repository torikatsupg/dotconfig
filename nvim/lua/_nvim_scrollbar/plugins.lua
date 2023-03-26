local M = {}

M.nvim_scrollbar = {
  'petertriho/nvim-scrollbar',
  commit = 'f85b29805cf917f9b1d5ff0c9a52c5b1bdca5943',
  config = function() require '_nvim_scrollbar.config'.config_nvim_scrollbar() end,
  opt = true,
  event = 'BufRead',
  requires = {
    'kevinhwang91/nvim-hlslens',
    tag = 'v1.0.0',
    opt = true,
    config = function() require '_nvim_scrollbar.config'.config_hlslens() end,
  },
  wants = 'nvim-hlslens',
}

return M
