local M = {}
local rc = require 'indent_blankline.rc'
local treesitter = require '_treesitter.plugins'

  M.indent_blankline =  {
    'lukas-reineke/indent-blankline.nvim',
    tag = 'v2.20.4',
    opt = true,
    event = { 'BufRead' },
    config = rc.config_indent_blankline,
    requires = {
      treesitter.nightfox
    },
    wants = {
      'nightfox.nvim'
    }
  }
return M