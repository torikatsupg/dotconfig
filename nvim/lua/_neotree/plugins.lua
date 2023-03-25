
local M = {}

local f = require 'foundations.plugins'
M.neotree = {
'nvim-neo-tree/neo-tree.nvim',
branch = "v2.x",
opt = true,
cmd = {'NeoTree'},
config = function()
  require 'neo-tree'.setup({
    -- popup_border_style = 'rounded',
    -- enable_git_status = true,
    -- enable_diagnostics = true,
  })
end,
requires = {
  f.plenary,
  f.nvim_web_devicions,
  f.nui,
},
wants = {
  'plenary.nvim',
  'nvim-web-devicons',
  'nui.nvim'
},
}
return M