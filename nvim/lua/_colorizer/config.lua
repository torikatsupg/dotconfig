local M = {}
M.colorizer = function ()
      require 'colorizer'.setup({
        user_default_options = {
          mode = 'virtualtext'
        }
      })
  
end
return M