
local M = {}
  M.lspsaga = {
    "glepnir/lspsaga.nvim",
    commit = 'bd55b175a4546334a197821cd4bfc19ba94e1a82',
    config = 
    require 'lspsaga.rc'.config,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
    },
    opt = true,
    event = { 'BufRead' },
    cmd = { 'Lspsaga' },
  }

  return M