local M = {}

local vim_repeat = {
  'tpope/vim-repeat',
  opt = true,
  config = function() require '_vim_surround.config'.vim_repeat() end,
}

M.vim_surround = {
  'tpope/vim-surround',
  opt = true,
  keys = {
    '<Plug>Dsurround',
    '<Plug>CSurround',
    '<Plug>YSurround',
    '<Plug>Yssurround',
    '<Plug>VSurround',
    '<Plug>VgSurround',
    '<Plug>Isurround',
    '<Plug>ISurround',
  },
  setup = require '_vim_surround.setup'.vim_surround,
  requires = vim_repeat,
  wants = 'vim-repeat'

}

return M
