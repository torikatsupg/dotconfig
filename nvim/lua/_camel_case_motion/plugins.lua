
local M = {}
M.camel_case_motion =  {
    'bkad/CamelCaseMotion',
    commit = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
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
      local set = vim.keymap.set
      local o = { noremap = true, silent = true }
      local ns = { 'n', 's'}
      local ox = { 'o', 'x'}
      set(ns, "∑", "<Plug>CamelCaseMotion_w", o)
      set(ns, "∫", "<Plug>CamelCaseMotion_b", o)
      set(ns, "´", "<Plug>CamelCaseMotion_e", o)
      set(ns, "g´", "<Plug>CamelCaseMotion_ge", o)
      set(ox, "i∑", "<Plug>CamelCaseMotion_iw", o)
      set(ox, "i∫", "<Plug>CamelCaseMotion_ib", o)
    end
  }
return M