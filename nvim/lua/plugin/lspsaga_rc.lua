return function()
  local saga = require("lspsaga")
  saga.init_lsp_saga ({
    code_action_icon = '',
    border_style = 'rounded'
  })
end

