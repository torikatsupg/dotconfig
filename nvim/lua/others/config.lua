local M = {}

M.gitsigns =  function()
  require('gitsigns').setup {
    current_line_blame           = true,
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  }
end

M.which_key  = function ()
        require("which-key").setup {}
  
end

M.auto_save = function ()
      vim.g.auto_save = 1  -- enable AutoSave on Vim startup
      vim.g.auto_save_silent = 1  -- enable AutoSave on Vim startup
      vim.g.auto_save_in_insert_mode = 0
      vim.g.auto_save_events = {"InsertLeave"}
  
end




return M