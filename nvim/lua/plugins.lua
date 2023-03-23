-- Install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  else
    return false
  end
end

-- Dependencies
local packer
local function init()
  ensure_packer()
  if packer == nil then
    packer = require('packer')
  end

  packer.init({
    disable_commands = true,
    display = { open_fn = require('packer.util').float },
    profile = {
      enable = false,
    }
  })

  packer.reset()
  local use = packer.use

  -- Plugins

  use {
    'wbthomason/packer.nvim',
    commit = '1d0cf98a561f7fd654c970c49f917d74fafe1530',
    opt = true,
  }

  local foundations = require 'plugin.foundations.foundations'
  use(foundations.treesitter)
  use(foundations.nvim_lspconfig)

  local treesitter = require 'plugin._treesitter.plugins'
  use(treesitter.nvim_ts_context_commentstring)
  -- use(treesitter.nvim_context_vt)
  use(treesitter.nvim_ts_rainbow)
  use(treesitter.nvim_autopairs)
  use(treesitter.vim_matchup)
  use(treesitter.nightfox)
  use(treesitter.nvim_ts_autotag)
  use(treesitter.hlargs)

  local telescope = require 'plugin.telescope.plugins'
  use(telescope.telescope)
  use(telescope.ghq)
  use(telescope.frecency)
  use(telescope.live_grep_args)
  use(telescope.media_files)
  use(telescope.ui_select)

  local cmp = require 'plugin.cmp.plugins'
  use(cmp.buffer)
  use(cmp.path)
  use(cmp.dictionary)
  use(cmp.emoji)
  use(cmp.luasnip)
  use(cmp.nvim_lsp)
  use(cmp.cmp_cmdline)
  use(cmp.cmp_copilot)

  local noice = require 'plugin.noice.plugins'
  use(noice.noice)

  -- use {
  --   'nvim-lualine/lualine.nvim',
  --   config = require 'plugin.lualine_rc',
  --   requires = {
  --     { 'SmiteshP/nvim-navic' },
  --     { 'kyazdani42/nvim-web-devicons' },
  --     { 'EdenEast/nightfox.nvim' },
  --   },
  -- }

  use {
    'norcalli/nvim-colorizer.lua',
    commit = '36c610a9717cc9ec426a07c8e6bf3b3abcb139d6',
    config = function()
      require 'colorizer'.setup()
    end,
    opt = true,
    event = { 'BufRead' },
  }

  -- dap
  -- use {
  --   'mfussenegger/nvim-dap',
  --   config = require 'plugin.dap_rc',
  --   requires = {
  --     {
  --       'theHamsta/nvim-dap-virtual-text',
  --       config = require 'plugin.nvim-dap-virtual-text_rc',
  --     },
  --     {
  --       'rcarriga/nvim-dap-ui',
  --       config = require 'plugin.nvim-da-ui_rc'
  --     }
  --   }
  -- }
  -- use {
  --   'akinsho/flutter-tools.nvim',
  --   config = require 'plugin.flutter-tools_rc',
  --   ft = { 'dart' }
  -- }
  -- use {
  --   'fatih/vim-go',
  --   ft = { 'go' }
  -- }
  -- use {
  --   'simrat39/rust-tools.nvim',
  --   config = require 'plugin.rust-tools_rc'
  -- }
  -- use {
  --   'folke/trouble.nvim',
  --   config = require 'plugin.trouble_rc',
  --   requires = {
  --     {
  --       'folke/lsp-colors.nvim',
  --       config = require 'plugin.lsp-colors_rc'
  --     },
  --   },
  -- }
  use {
    "glepnir/lspsaga.nvim",
    commit = 'bd55b175a4546334a197821cd4bfc19ba94e1a82',
    config = require 'plugin.lspsaga_rc',
    requires = {
      { "nvim-tree/nvim-web-devicons" },
    },
    opt = true,
    event = { 'BufRead' }
  }


  use {
    'petertriho/nvim-scrollbar',
    config = require 'plugin.nvim-scrollbar_rc',
    requires = {
      'kevinhwang91/nvim-hlslens',
      config = require 'plugin.hlslens_rc'
    },
    wants = { 'nvim-hlslens' },
    opt = true,
    event = { 'BufRead' }
  }

  -- use {
  --   'phaazon/hop.nvim',
  --   config = require 'plugin.hop_rc',
  --   branch = 'v2',
  --
  -- }
  --
  -- use {
  --   'lukas-reineke/indent-blankline.nvim',
  --   config = require 'plugin.indent-blankline_rc'
  -- }
  -- use {
  --   "folke/todo-comments.nvim",
  --   config = require 'plugin.todo-comments_rc',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'folke/trouble.nvim',            -- TODO(torikatsu): configure
  --     'nvim-telescope/telescope.nvim', -- TODO(torikatsu): configure
  --   },
  -- }

  -- use { 'bkad/CamelCaseMotion' }
  -- use { 'myusuf3/numbers.vim' }
  use {
    'tpope/vim-surround',
    opt = true,
    event = { 'InsertEnter' },
    requires = {
      'tpope/vim-repeat',
      config = require 'plugin.vim-repeat_rc',
      opt = true
    },
    wants = {
      'vim-repeat'
    }
  }

  -- use { 'ntpeters/vim-better-whitespace' }
  -- TODO(torikatsu): いれたい https://github.com/segeljakt/vim-silicon
  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   config = require 'plugin.gitsigns_rc'
  -- }
  use {
    'folke/which-key.nvim',
    config = require 'plugin.which-key_rc',
    opt = true,
    event = { 'CursorHold' },
  }

  use {
    'vim-scripts/vim-auto-save',
    config = require 'plugin.vim-auto-save_rc',
    opt = true,
    event = { 'InsertLeave' },
  }
end

-- Define ex commands
local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

local function encode_to_base64(str)
end


local cmd = vim.api.nvim_create_user_command
cmd("PackerInstall", function() plugins.install() end, { bang = true })
cmd("PackerUpdate", function() plugins.update() end, { bang = true })
cmd("PackerSync", function() plugins.sync() end, { bang = true })
cmd("PackerClean", function() plugins.clean() end, { bang = true })
cmd("PackerCompile", function() plugins.compile() end, { bang = true })
cmd("PackerRemove", [[:! rm -rf ~/.local/share/nvim]], { bang = true })
cmd("PackerStatus", function() plugins.status() end, { bang = true })
