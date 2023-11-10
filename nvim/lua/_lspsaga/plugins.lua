
local M = {}
  M.lspsaga = {
    "glepnir/lspsaga.nvim",
    commit = '71c1793c86a3fbf405c3100577b72c148ca91d9e',
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
