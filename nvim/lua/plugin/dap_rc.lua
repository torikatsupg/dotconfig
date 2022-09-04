-- TODO(torikatsu): configure
return function()
  local dap = require('dap')

  require("nvim-dap-virtual-text").setup({
    commented = true,
  })
end
