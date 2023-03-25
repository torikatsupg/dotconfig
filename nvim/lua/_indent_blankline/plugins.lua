local M = {}
local treesitter = require '_treesitter.plugins'

  M.indent_blankline =  {
    'lukas-reineke/indent-blankline.nvim',
    tag = 'v2.20.4',
    opt = true,
    event = { 'BufRead' },
    config = function () require '_indent_blankline.config'.indent_blankline() end,
    requires = {
      treesitter.nightfox
    },
    wants = {
      'nightfox.nvim'
    }
  }
return M