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
  set(n, '<Leader>ff', b 'find_files', o)
  set(n, '<leader>f:', b 'command_history', o)
  set(n, '<leader>fh', b 'help_tags', o)
  set(n, '<leader>fm', b 'marks', o)
  set(n, '<leader>fj', b 'jumplist', o)
end

M.frecency = function()
  vim.keymap.set('n', '<Leader>fr', function() 
      local t = require 'telescope'
      t.load_extension 'frecency'
      return t.extensions.frecency.frecency()
  end, 
  { noremap = true, silent = false })
end

M.ghq = function()
  vim.keymap.set('n', '<Leader>fq', function() 
      local t = require 'telescope'
      t.load_extension 'ghq'
      return t.extensions.ghq.list()
  end, 
  { noremap = true, silent = false })
end

M.live_grep_args = function()
  vim.keymap.set('n', '<Leader>fg', function() 
      local t = require 'telescope'
      t.load_extension 'live_grep_args'
      return t.extensions.live_grep_args.live_grep_args()
  end, 
  { noremap = true, silent = false })
end

M.setup_media_files = function()
  vim.keymap.set('n', '<Leader>fM', function() 
      local t = require 'telescope'
      t.load_extension 'media_files'
      return t.extensions.media_files.media_files()
  end, 
  { noremap = true, silent = false })
end

M.ui_select = function()
  vim.keymap.set('n', 'ga', function (...)
    require 'telescope._extensions.ui-select'
    vim.lsp.buf.code_action(...)
  end,
  { noremap = true, silent = false })
end

return M
