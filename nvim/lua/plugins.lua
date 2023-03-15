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
    display = { open_fn = require('packer.util').float }
  })

  packer.reset()
  local use = packer.use

  -- Plugins

  use {
    'wbthomason/packer.nvim',
    commit = '1d0cf98a561f7fd654c970c49f917d74fafe1530',
    opt = true,
  }

  local treesitter = require 'plugin._treesitter.plugins'
  use(treesitter.nvim_ts_context_commentstring)
  use(treesitter.nvim_context_vt)
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

  local mason = require 'plugin.mason.plugins'
  use(mason.mason)
  use(mason.mason_lspconfig)

  local cmp = require 'plugin.cmp.plugins'
  use(cmp.buffer)
  use(cmp.path)
  use(cmp.dictionary)
  use(cmp.emoji)
  -- use(cmp.luasnip)
  -- use(cmp.nvim_lsp)

  use {
    'nvim-lualine/lualine.nvim',
    config = require 'plugin.lualine_rc',
    requires = {
      { 'SmiteshP/nvim-navic' },
      { 'kyazdani42/nvim-web-devicons' },
      { 'EdenEast/nightfox.nvim' },
    },
  }

  use {
    'j-hui/fidget.nvim',
    config = require 'plugin.fidget_rc'
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = require 'plugin.nvim-colorizer_rc'
  }


  use {
    'rcarriga/nvim-notify',
    config = require 'plugin.nvim-notify_rc'
  }
  -- dap
  use {
    'mfussenegger/nvim-dap',
    config = require 'plugin.dap_rc',
    requires = {
      {
        'theHamsta/nvim-dap-virtual-text',
        config = require 'plugin.nvim-dap-virtual-text_rc',
      },
      {
        'rcarriga/nvim-dap-ui',
        config = require 'plugin.nvim-da-ui_rc'
      }
    }
  }
  use {
    'akinsho/flutter-tools.nvim',
    config = require 'plugin.flutter-tools_rc',
    ft = { 'dart' }
  }
  use {
    'fatih/vim-go',
    ft = { 'go' }
  }
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
      { "nvim-treesitter/nvim-treesitter" },
    },
  }


  use {
    'petertriho/nvim-scrollbar',
    config = require 'plugin.nvim-scrollbar_rc',
    requires = {
      'kevinhwang91/nvim-hlslens',
      config = require 'plugin.hlslens_rc'
    }
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

  use {
    "nvim-neo-tree/neo-tree.nvim",
    config = require 'plugin.neo-tree_rc',
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  }
  use {
    'numToStr/Comment.nvim',
    config = require 'plugin.comment_rc'
  }
  use { 'bkad/CamelCaseMotion' }
  use { 'myusuf3/numbers.vim' }
  use {
    'tpope/vim-surround',
    requires = {
      'tpope/vim-repeat',
      config = require 'plugin.vim-repeat_rc'
    }
  }
  use { 'ntpeters/vim-better-whitespace' }
  -- TODO(torikatsu): いれたい https://github.com/segeljakt/vim-silicon
  --
  use {
    'TimUntersberger/neogit',
    config = require 'plugin.neogit_rc',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      {
        'sindrets/diffview.nvim',
        requires = {
          { 'plenary.nvim' },
          { 'nvim-web-devicons' },
        }
      }
    }
  }
  use {
    'akinsho/git-conflict.nvim',
    config = require 'plugin.git-conflict_rc'
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = require 'plugin.gitsigns_rc'
  }
  use {
    'folke/which-key.nvim',
    config = require 'plugin.which-key_rc'
  }
  use {
    "nvim-neotest/neotest",
    config = require 'plugin.neotest_rc',
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      'sidlatau/neotest-dart',
    }
  }
  use {
    'vim-scripts/vim-auto-save',
    config = require 'plugin.vim-auto-save_rc'
  }
end

-- Define ex commands
local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

local cmd = vim.api.nvim_create_user_command
cmd("PackerInstall", function() plugins.install() end, { bang = true })
cmd("PackerUpdate", function() plugins.update() end, { bang = true })
cmd("PackerSync", function() plugins.sync() end, { bang = true })
cmd("PackerClean", function() plugins.clean() end, { bang = true })
cmd("PackerCompile", function() plugins.compile() end, { bang = true })
cmd("PackerRemove", [[:! rm -rf ~/.local/share/nvim]], { bang = true })

