local M = {}

local foundations = require 'foundations.plugins'
M.deepl = {
  'torikatsupg/deepl.nvim',
  opt = true,
  module = { 'deepl' },
  setup = function()
    vim.keymap.set('v', '<C-t>', function()
      vim.env.deepl_nvim_apikey = ''
      require 'deepl'.translate()
    end, { noremap = true, silent = true })
  end,
  requires = foundations.plenary,
  wants = foundations.plenary.name,
}

return M
