local M = {}
local rc = require 'others/rc'


M.vim_better_whitespace =  {
    'ntpeters/vim-better-whitespace',
    commit = '1b22dc57a2751c7afbc6025a7da39b7c22db635d',
    opt = true,
    event = { 'BufRead' },
  }

M.gitsigns = {
    'lewis6991/gitsigns.nvim',
    commit = 'ca473e28382f1524aa3d2b6f04bcf54f2e6a64cb',
    config = rc.config_gitsigns,
    opt = true,
    event = { 'Bufread' },
  }

  M.which_key_nvim = {
    'folke/which-key.nvim',
    config = function ()
        require("which-key").setup {}
    end,
    opt = true,
    event = { 'CursorHold' },
  }

  M.vim_auto_save = {
    'vim-scripts/vim-auto-save',
    config = function ()
      vim.g.auto_save = 1  -- enable AutoSave on Vim startup
      vim.g.auto_save_silent = 1  -- enable AutoSave on Vim startup
      vim.g.auto_save_in_insert_mode = 0
      vim.g.auto_save_events = {"InsertLeave"}
    end,
    opt = true,
    event = { 'InsertLeave' },
  }

  return M