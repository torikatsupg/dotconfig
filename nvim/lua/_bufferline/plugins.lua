local M = {}

local foundations = require 'foundations.plugins'
M.bufferline =  {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    opt = true,
    event = { 'BufRead' },
    config = function() require '_bufferline.config'.bufferline() end,
    requires = foundations.nvim_web_devicions,
    wants = 'nvim-web-devicons',
  }

  return M