local M = {}
local foundations = require 'foundations.plugins'
M.noice = {
  "folke/noice.nvim",
  tag = 'v1.10.1',
  opt = true,
  config = function() require '_noice.config'.noice() end,
  event = 'VimEnter',
  requires = {
    foundations.nui,
    {
      "rcarriga/nvim-notify",
      commit = '02047199e2752223c77c624160f720ca227944a9',
      opt = true
    }
  },
  wants = {
    foundations.nui.name,
    'nvim-notify',
  },
}
return M
