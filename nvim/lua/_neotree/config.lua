local M = {}
M.neotree = function()
  require 'neo-tree'.setup({
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    mappings = {
      ['q'] = "revert_preview"
    }
  })
end

return M
