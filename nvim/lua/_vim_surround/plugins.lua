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
    '<Plug>CSurround',
    '<Plug>Csurround',
    '<Plug>Dsurround',
    '<Plug>ISurround',
    '<Plug>Isurround',
    '<Plug>SurroundRepeat',
    '<Plug>VSurround',
    '<Plug>VgSurround',
    '<Plug>YSsurround',
    '<Plug>YSurround',
    '<Plug>Yssurround',
    '<Plug>Yssurround',
    '<Plug>Ysurround',
  },
  setup = require '_vim_surround.setup'.vim_surround,
  requires = vim_repeat,
  wants = 'vim-repeat'
}

return M
