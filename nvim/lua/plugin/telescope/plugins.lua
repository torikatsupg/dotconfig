local M = {}
local rc = require 'plugin.telescope.rc'
local fundations = require 'plugin.foundations'

M.telescope = {
  'nvim-telescope/telescope.nvim',
  config = rc.config,
  tag = '0.1.1',
  opt = true,
  run = 'brew install ripgrep && brew install fd',
  module_pattern = { "telescope.*" },
  setup = rc.setup,
  requires = {
    fundations.use_plenary,
    fundations.plenary,
  },
}

M.ghq = {
  'nvim-telescope/telescope-ghq.nvim',
  commit = 'dc1022f91100ca06c9c7bd645f08e2bf985ad283',
  opt = true,
  run = 'brew install ghq',
  module = { 'telescope._extensions.ghq' },
  setup = rc.setup_ghq,
  requires = { M.telescope }
}

M.frecency = {
  'nvim-telescope/telescope-frecency.nvim',
  commit = 'e5696afabd8753d772987ea48434d9c0d8b0aa6b',
  opt = true,
  module = { 'telescope._extensions.frecency' },
  requires = {
    {
      "kkharji/sqlite.lua",
      opt = true,
      tag = 'v1.2.2',
    },
    M.telescope
  },
  wants = { "sqlite.lua", },
  setup = rc.setup_frecency,
}

M.live_grep_args = {
  'nvim-telescope/telescope-live-grep-args.nvim',
  commit = '7de3baef1ec4fb77f7a8195fe87bebd513244b6a',
  opt = true,
  module = { 'telescope._extensions.live_grep_args' },
  setup = rc.setup_live_grep_args,
  requires = { M.telescope }
}

M.media_files =  {
  'nvim-telescope/telescope-media-files.nvim',
  commit = '0826c7a730bc4d36068f7c85cf4c5b3fd9fb570a',
  opt = true,
  run =
  'brew install chafa && brew install imagemagic@6 && brew install ffmpegthumbnailer && brew install pdftoppm',
  module = { 'telescop._extensions.media_files' },
  setup = rc.setup_media_files,
  requires = { M.telescope }
}

M.ui_select = {
  'nvim-telescope/telescope-ui-select.nvim',
  commit = '62ea5e58c7bbe191297b983a9e7e89420f581369',
  opt = true,
  module = { 'telescope._extensions.ui-select' },
  setup = rc.setup_ui_select,
  config = rc.config_ui_select,
  requires = { M.telescope }
}

return M
