
local M = {}
  M.lspsaga = {
    "glepnir/lspsaga.nvim",
    config = function ()
      require '_lspsaga.config'.lspsaga()
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
    },
    opt = true,
    event = { 'BufRead' },
    cmd = { 'Lspsaga' },
  }

  return M
