M = {}

M.nvim_ts_context_commentstring = function()
  local config = require 'nvim-treesitter.configs'
  config.setup = {
    context_commentstring = {
      enable = true,
    },
  }
end

M.context_vt = function()
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

M.hlargs = function()
  require('hlargs').setup()
end

M.ts_autotag = function()
  require 'nvim-ts-autotag'.setup({})
end

M.autopairs = function()
  require "nvim-autopairs".setup {
    disable_filetype = { "TelescopePrompt" },
    check_ts = true,
  }
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )
end

M.matchup = function()
  local config = require 'nvim-treesitter.configs'
  config.setup {
    matchup = {
      enable = true,
    },
  }
end

M.nightfox = function()
  require('nightfox').setup({
    options = {
      transparent = true,
    }
  })

  vim.cmd("colorscheme duskfox")
end

return M
