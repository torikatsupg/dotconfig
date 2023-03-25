local M = {}
M.vim_surround = function ()
      vim.g.surround_no_mappings = true
      local o = { noremap = true, silent = true }
      local n = 'n'
      local s = vim.keymap.set
      s(n, 'ds', '<Plug>Dsurround', o)
      s(n, 'cs', '<Plug>Csurround', o)
      s(n, 'cS', '<Plug>CSurround', o)
      s(n, 'ys', '<Plug>Ysurround', o)
      s(n, 'yS', '<Plug>YSurround', o)
      s(n, 'yss', '<Plug>Yssurround', o)
      s(n, 'ySs', '<Plug>YSsurround', o)
      s(n, 'ySS', '<Plug>YSsurround', o)
      s('x', 'S', '<Plug>VSurround', o)
      s('x', 'gS', '<Plug>VgSurround', o)
      s('i', '<C-S>', '<Plug>Isurround', o)
      s('i', '<C-G>s', '<Plug>Isurround', o)
      s('i', '<C-G>S', '<Plug>ISurround', o)
end
return M