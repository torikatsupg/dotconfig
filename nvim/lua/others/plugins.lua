local M = {}

M.vim_better_whitespace =  {
    'ntpeters/vim-better-whitespace',
    commit = '1b22dc57a2751c7afbc6025a7da39b7c22db635d',
    opt = true,
    event = { 'BufRead' },
  }

M.gitsigns = {
    'lewis6991/gitsigns.nvim',
    commit = 'ca473e28382f1524aa3d2b6f04bcf54f2e6a64cb',
    config = function()require'others.config'.gitsigns()end,
    opt = true,
    event = { 'Bufread' },
  }

  M.which_key_nvim = {
    'folke/which-key.nvim',
    config = function ()require'others.config'.which_key()end,
    opt = true,
    event = { 'CursorHold' },
  }

  M.vim_auto_save = {
    'vim-scripts/vim-auto-save',
    config = function ()require'others.config'.auto_save()end,
    opt = true,
    event = { 'InsertLeave' },
  }

  M.startup_time = {
    'dstein64/vim-startuptime',
    commit = '6580cf539c33a212f4f5542068a3b4dd2b3ad834',
    opt = true,
    cmd = { 'StartupTime' },
  }

  return M