
local M = {}

M.config = function()
  local telescope = require 'telescope'
  local actions = require 'telescope.actions'
  telescope.setup {
    defaults = {
      prompt_prefix = '🔍',
      mappings = {
        n = {
          q = actions.close,
        },
        i = {
          ['<Esc>'] = actions.close,
        }
      }
    }
  }
end

M.ui_select = function()

  local t = require 'telescope'
  t.setup {
    extensions = {
      ['ui-select'] = { require 'telescope.themes'.get_cursor() }
    }
  }
  t.load_extension('ui-select')
end


return M