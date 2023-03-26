local M = {}
M.vim_surround = function()
  vim.g.surround_no_mappings = true
  local o = { noremap = true, silent = true }
  local n = 'n'
  local s = vim.keymap.set

  local p = {
    Ds = '<Plug>Dsurround',
    Cs = '<Plug>Csurround',
    CS = '<Plug>CSurround',
    Ys = '<Plug>Ysurround',
    YS = '<Plug>YSurround',
    Yss = '<Plug>Yssurround',
    YSs = '<Plug>YSsurround',
    VS = '<Plug>VSurround',
    VgS = '<Plug>VgSurround',
    Is = '<Plug>Isurround',
    IS = '<Plug>ISurround',
  }

  s(n, 'ds', p.Ds, o)
  s(n, 'cs', p.Cs, o)
  s(n, 'cS', p.CS, o)
  s(n, 'ys', p.Ys, o)
  s(n, 'yS', p.YS, o)
  s(n, 'yss', p.Yss, o)
  s(n, 'ySs', p.YSs, o)
  s(n, 'ySS', p.YSs, o)
  s('x', 'S', p.VS, o)
  s('x', 'gS', p.VgS, o)
  s('i', '<C-S>', p.Is, o)
  s('i', '<C-G>s', p.Is, o)
  s('i', '<C-G>S', p.IS, o)
end
return M
