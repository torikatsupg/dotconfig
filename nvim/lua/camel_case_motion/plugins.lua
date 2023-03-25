
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
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }
      keymap({ "n", "s" }, "∑", "<Plug>CamelCaseMotion_w", opts)
      keymap({ "n", "s" }, "∫", "<Plug>CamelCaseMotion_b", opts)
      keymap({ "n", "s" }, "´", "<Plug>CamelCaseMotion_e", opts)
      keymap({ "n", "s" }, "g´", "<Plug>CamelCaseMotion_ge", opts)

      keymap({ "o", "x" }, "i∑", "<Plug>CamelCaseMotion_iw", opts)
      keymap({ "o", "x" }, "i∫", "<Plug>CamelCaseMotion_ib", opts)
    end
  }
return M