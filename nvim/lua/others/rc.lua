local M = {}

M.config_gitsigns =  function()
  require('gitsigns').setup {
    current_line_blame           = true,
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  }
end




return M