local M = {}

M.config_nvim_scrollbar = function()
  require("scrollbar").setup()
  require("scrollbar.handlers.search").setup()
end


M.config_hlslens = function()
  require('hlslens').setup({
    override_lens = function(render, _, _, _, _)
      render.setVirt(0, 0, 0, {}, {})
    end
  })
end


return M

