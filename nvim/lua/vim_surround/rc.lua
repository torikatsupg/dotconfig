local M = {}

M.config_vim_repeat = function ()
      vim.fn['repeat#set'](vim.api.nvim_replace_termcodes('<Plug>MyWonderfulMap', true, false, true), vim.v.count)
end

return M