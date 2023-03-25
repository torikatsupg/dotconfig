local M = {}
M.vim_surround = function ()
      vim.g.surround_no_mappings = true
      local o = { noremap = true, silent = true }
      local n = 'n'
      local x = 'x'
      local i = 'i'
      local set = vim.keymap.set
      set(n, 'ds', '<Plug>Dsurround', o)
      set(n, 'cs', '<Plug>Csurround', o)
      set(n, 'cS', '<Plug>CSurround', o)
      set(n, 'ys', '<Plug>Ysurround', o)
      set(n, 'yS', '<Plug>YSurround', o)
      set(n, 'yss', '<Plug>Yssurround', o)
      set(n, 'ySs', '<Plug>YSsurround', o)
      set(n, 'ySS', '<Plug>YSsurround', o)
      set(x, 'S', '<Plug>VSurround', o)
      set(x, 'gS', '<Plug>VgSurround', o)
      set(i, '<C-S>', '<Plug>Isurround', o)
      set(i, '<C-G>s', '<Plug>Isurround', o)
      set(i, '<C-G>S', '<Plug>ISurround', o)
  
end
return M