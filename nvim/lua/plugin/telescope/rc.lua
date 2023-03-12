local m = {}

-- default
m.setup = function()
  local helper = require 'plugin.telescope.helper'
  local opts = { noremap = true, silent = false }
  vim.keymap.set("n", "<Leader>ff", helper.builtin "find_files", opts)
  vim.keymap.set("n", "<leader>f:", helper.builtin "command_history", opts)
  vim.keymap.set("n", "<leader>fh", helper.builtin "help_tags", opts)
  vim.keymap.set("n", "<leader>fm", helper.builtin "marks", opts)
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
  local helper = require 'plugin.telescope.helper'
  local opts = { noremap = true, silent = false }
  vim.keymap.set("n", "<Leader>fr", helper.extensions("frecency", "frecency"), opts)
end

-- ghq
m.setup_ghq = function()
  local helper = require 'plugin.telescope.helper'
  local opts = { noremap = true, silent = false }
  vim.keymap.set("n", "<Leader>fq", helper.extensions("ghq", "list"), opts)
end

-- live_grep_args
m.setup_live_grep_args = function()
  local helper = require 'plugin.telescope.helper'
  local opts = { noremap = true, silent = false }
  vim.keymap.set("n", "<Leader>fg", helper.extensions("live_grep_args", "live_grep_args"), opts)
end

-- media_files
m.setup_media_files = function()
  local helper = require 'plugin.telescope.helper'
  local opts = { noremap = true, silent = false }
  vim.keymap.set("n", "<Leader>fM", helper.extensions("media_files", "media_files"), opts)
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
