M = {}

M.config_yati = function()
  local config = require 'nvim-treesitter.configs'
  config.setup = {
    yati = {
      enable = true,
      disable = {},
      indent = {
        enable = false
      }
    },
  }
end

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
    custom_parser = function(node, ft, opts)
      -- TODO(torikatsu): define parser for flutter
      return nil
      -- local utils = require('nvim_context_vt.utils')
      -- if node:type() == 'function' then
      --   return nil
      -- end
      -- return '// ' .. utils.get_node_text(node)[1]
    end,
  })
end

M.config_nvim_ts_rainbow = function()
  local config = require 'nvim-treesitter.configs'
  config.setup = {
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
  }
end

M.config_nvim_ts_autotag = function()
  local config = require 'nvim-treesitter.configs'
  config.setup {
    autotag = {
      enable = true,
    }
  }
end

M.config_nvim_autopairs = function()
  local autopairs = require "nvim-autopairs"
  autopairs.setup {
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


return M
