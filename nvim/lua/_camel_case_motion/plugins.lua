local M = {}
M.camel_case_motion = {
  'bkad/CamelCaseMotion',
  opt = true,
  keys = {
    '<Plug>CamelCaseMotion_w',
    '<Plug>CamelCaseMotion_b',
    '<Plug>CamelCaseMotion_e',
    '<Plug>CamelCaseMotion_ge',
    '<Plug>CamelCaseMotion_iw',
    '<Plug>CamelCaseMotion_ib',
    '<Plug>CamelCaseMotion_ie',
  },
  setup = function()
    local prefix = '<Plug>CamelCaseMotion_'
    local set = vim.keymap.set
    local o = { noremap = true, silent = true }
    local ns = { 'n', 's' }
    local ox = { 'o', 'x' }
    set(ns, '∑', prefix .. 'w', o)
    set(ns, '∫', prefix .. 'b', o)
    set(ns, '´', prefix .. 'e', o)
    set(ns, 'g´', prefix .. 'ge', o)
    set(ox, 'i∑', prefix .. 'iw', o)
    set(ox, 'i∫', prefix .. 'ib', o)
  end
}
return M
