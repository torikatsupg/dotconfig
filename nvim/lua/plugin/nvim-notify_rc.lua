return function()
  local notify = require 'notify'
  notify.setup {
    background_color = '#000000'
  }
  vim.notify = notify
end
