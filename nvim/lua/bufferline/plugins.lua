local M = {}

M.bufferline =  {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    opt = true,
    event = { 'BufRead' },
    config = require 'bufferline.rc'.config,
    requires = {
      M.nvim_web_devicons,
    },
    wants = {
      'nvim-web-devicons',
    },
  }

  return M