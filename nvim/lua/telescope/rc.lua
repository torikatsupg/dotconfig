
local m = {}



-- default
m.setup = function()
  local builtin = function(name)
    return function()
      return require("telescope.builtin")[name]({})
    end
  end

  local opts = { noremap = true, silent = false }
  vim.keymap.set("n", "<Leader>ff", builtin "find_files", opts)
  vim.keymap.set("n", "<leader>f:", builtin "command_history", opts)
  vim.keymap.set("n", "<leader>fh", builtin "help_tags", opts)
  vim.keymap.set("n", "<leader>fm", builtin "marks", opts)
  vim.keymap.set("n", "<leader>fj", builtin "jumplist", opts)
end

m.config = function()
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

-- frecency
m.setup_frecency = function()
  -- local helper = require 'telescope.helper'

  local extensions = function(name, prop)
    return function()
      local telescope = require "telescope"
      telescope.load_extension(name)
      return telescope.extensions[name][prop]({})
    end
  end
  local opts = { noremap = true, silent = false }
  vim.keymap.set("n", "<Leader>fr", extensions("frecency", "frecency"), opts)
end

-- ghq
m.setup_ghq = function()
  local extensions = function(name, prop)
    return function()
      local telescope = require "telescope"
      telescope.load_extension(name)
      return telescope.extensions[name][prop]({})
    end
  end
  local opts = { noremap = true, silent = false }
  vim.keymap.set("n", "<Leader>fq", extensions("ghq", "list"), opts)
end

-- live_grep_args
m.setup_live_grep_args = function()
  local extensions = function(name, prop)
    return function()
      local telescope = require "telescope"
      telescope.load_extension(name)
      return telescope.extensions[name][prop]({})
    end
  end
  local opts = { noremap = true, silent = false }
  vim.keymap.set("n", "<Leader>fg", extensions("live_grep_args", "live_grep_args"), opts)
end

-- media_files
m.setup_media_files = function()
  local extensions = function(name, prop)
    return function()
      local telescope = require "telescope"
      telescope.load_extension(name)
      return telescope.extensions[name][prop]({})
    end
  end
  local opts = { noremap = true, silent = false }
  vim.keymap.set("n", "<Leader>fM", extensions("media_files", "media_files"), opts)
end

-- ui-select
m.setup_ui_select = function()
  local function code_action(...)
    require 'telescope._extensions.ui-select'
    vim.lsp.buf.code_action(...)
  end
  local opts = { noremap = true, silent = false }
  vim.keymap.set("n", "ga", code_action, opts)
end

m.config_ui_select = function()
  local telescope = require 'telescope'
  local themes = require 'telescope.themes'

  telescope.setup {
    extensions = {
      ["ui-select"] = { themes.get_cursor {}, }
    }
  }
  require("telescope").load_extension("ui-select")
end

return m
