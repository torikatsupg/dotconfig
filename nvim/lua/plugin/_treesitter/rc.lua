M = {}

-- TODO(torikatus): setup with https://github.com/numToStr/Comment.nvim
M.config_nvim_ts_context_commentstring = function()
  local config = require 'nvim-treesitter.configs'
  config.setup = {
    context_commentstring = {
      enable = true,
    },
  }
end

M.config_nvim_context_vt = function()
  require('nvim_context_vt').setup({
    enabled = true,
    disable_ft = { 'markdown' },
    disable_virtual_lines_ft = { 'yaml' },
    custom_parser = function(node, ft, opts)
      local utils = require('nvim_context_vt.utils')
      if node:type() == 'function' then
        return nil
      end
      return '--> ' .. utils.get_node_text(node)[1]
    end,
  })
end

M.config_nvim_ts_rainbow = function()
end

M.config_hlargs = function ()
  require('hlargs').setup()
end

M.config_nvim_ts_autotag = function()
  require'nvim-ts-autotag'.setup({})

end

M.config_nvim_autopairs = function()
  require "nvim-autopairs".setup {
    disable_filetype = { "TelescopePrompt" },
  }
end

M.config_matchup = function()
  local config = require 'nvim-treesitter.configs'
  config.setup {
    matchup = {
      enable = true,
    },
  }
end

M.config_nightfox = function ()
  require('nightfox').setup({
    options = {
      transparent = true,
    }
  })
  vim.cmd("colorscheme duskfox")
end

return M
