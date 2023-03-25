return function ()
  vim.g.auto_save = 1  -- enable AutoSave on Vim startup
  vim.g.auto_save_silent = 1  -- enable AutoSave on Vim startup
  vim.g.auto_save_in_insert_mode = 0
  vim.g.auto_save_events = {"InsertLeave"}
end
