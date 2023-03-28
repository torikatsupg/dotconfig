local M = {}

M.telescope = function()
  local b = function(name)
    return function()
      return require('telescope.builtin')[name]({})
    end
  end

  local o = { noremap = true, silent = false }
  local set = vim.keymap.set
  local n = 'n'
  set(n, 'ƒƒ', b 'find_files', o)
  set(n, 'ƒ…', b 'command_history', o)
  set(n, 'ƒ˙', b 'help_tags', o)
  set(n, 'ƒµ', b 'marks', o)
  set(n, 'ƒ∆', b 'jumplist', o)
end

M.frecency = function()
  vim.keymap.set('n', 'ƒ®', function()
      local t = require 'telescope'
      t.load_extension 'frecency'
      return t.extensions.frecency.frecency()
    end,
    { noremap = true, silent = true })
end

M.ghq = function()
  vim.keymap.set('n', 'ƒœ', function()
      local t = require 'telescope'
      t.load_extension 'ghq'
      return t.extensions.ghq.list()
    end,
    { noremap = true, silent = true })
end

M.live_grep_args = function()
  vim.keymap.set('n', 'ƒ©', function()
      local t = require 'telescope'
      t.load_extension 'live_grep_args'
      return t.extensions.live_grep_args.live_grep_args()
    end,
    { noremap = true, silent = true })
end

M.setup_media_files = function()
  vim.keymap.set('n', 'ƒM', function()
      local t = require 'telescope'
      t.load_extension 'media_files'
      return t.extensions.media_files.media_files()
    end,
    { noremap = true, silent = true })
end

M.ui_select = function()
  vim.keymap.set('n', 'ƒå', function(...)
      require 'telescope._extensions.ui-select'
      vim.lsp.buf.code_action(...)
    end,
    { noremap = true, silent = true })
end

return M
