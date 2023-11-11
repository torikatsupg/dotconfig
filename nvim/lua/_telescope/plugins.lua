local M = {}
local foundations = require 'foundations.plugins'
local setup = require '_telescope.setup'

M.telescope = {
  'nvim-telescope/telescope.nvim',
  config = function() require '_telescope.config'.config() end,
  opt = true,
  run = 'brew install ripgrep && brew install fd',
  module_pattern = "telescope.*",
  setup = setup.telescope,
  requires = {
    foundations.plenary,
    foundations.treesitter,
  },
  wants = {
    foundations.plenary.name,
    foundations.treesitter.name,
  },
  name = 'telescope.nvim',
}

M.ghq = {
  'nvim-telescope/telescope-ghq.nvim',
  opt = true,
  run = 'brew install ghq',
  module = 'telescope._extensions.ghq',
  setup = setup.ghq,
  requires = M.telescope,
  wants = M.telescope.name,
}

M.frecency = {
  'nvim-telescope/telescope-frecency.nvim',
  opt = true,
  module = 'telescope._extensions.frecency',
  setup = setup.frecency,
  requires = {
    {
      "kkharji/sqlite.lua",
      opt = true,
    },
    M.telescope
  },
  wants = {
    "sqlite.lua",
    M.telescope.name,
  },
}

M.live_grep_args = {
  'nvim-telescope/telescope-live-grep-args.nvim',
  opt = true,
  module = 'telescope._extensions.live_grep_args',
  setup = setup.live_grep_args,
  requires = M.telescope,
  wants = M.telescope.name,
}

M.media_files = {
  'nvim-telescope/telescope-media-files.nvim',
  opt = true,
  run =
  'brew install chafa && brew install imagemagic@6 && brew install ffmpegthumbnailer && brew install pdftoppm',
  module = 'telescop._extensions.media_files',
  setup = setup.setup_media_files,
  requires = M.telescope,
  wants = M.telescope.name,
}

M.ui_select = {
  'nvim-telescope/telescope-ui-select.nvim',
  opt = true,
  module = 'telescope._extensions.ui-select',
  setup = setup.ui_select,
  config = function() require '_telescope.config'.ui_select() end,
  requires = M.telescope,
  wants = M.telescope.name,
}

return M
