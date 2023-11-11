local M = {}
local foundations = require 'foundations.plugins'
M.noice = {
  "folke/noice.nvim",
  opt = true,
  config = function() require '_noice.config'.noice() end,
  event = 'VimEnter',
  requires = {
    foundations.nui,
    {
      "rcarriga/nvim-notify",
      opt = true
    }
  },
  wants = {
    foundations.nui.name,
    'nvim-notify',
  },
}
return M
