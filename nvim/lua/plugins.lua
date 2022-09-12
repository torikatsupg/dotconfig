local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.cmd [[packadd packer.nvim]]
end

require 'packer'.startup({
  function(use)
    use { 'wbthomason/packer.nvim', opt = true }
    use {
      'EdenEast/nightfox.nvim',
      config = require 'plugin.nightfox_rc'
    }
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
      'williamboman/mason.nvim',
      config = require 'plugin.mason-lspconfig_rc',
      requires = {
        { 'neovim/nvim-lspconfig' },
        {
          'williamboman/mason-lspconfig.nvim',
          requires = {
            { 'hrsh7th/cmp-nvim-lsp' }
          }
        },
      },
    }
    use {
      'neovim/nvim-lspconfig',
      config = require 'plugin.nvim-lspconfig_rc'
    }
    use {
      'rcarriga/nvim-notify',
      config = require 'plugin.nvim-notify_rc'
    }
    -- dap
    -- use {
    --   'mfussenegger/nvim-dap',
    --   config = require'plugin.dap_rc'
    -- }
    -- use { 'rcarriga/nvim-dap-ui' }
    -- use { 'theHamsta/nvim-dap-virtual-text' }
    use {
      'akinsho/flutter-tools.nvim',
      config = require 'plugin.flutter-tools_rc',
      ft = { 'dart' }
    }
    use {
      'folke/trouble.nvim',
      config = require 'plugin.trouble_rc',
      requires = {
        { 'folke/lsp-colors.nvim',
          config = require 'plugin.lsp-colors_rc'
        },
      },
    }
    use {
      'hrsh7th/nvim-cmp',
      config = require 'plugin.nvim-cmp_rc',
      requires = {
        -- TODO(torikatsu): add fuzz_buffer, fuzzy_path, rg
        -- TODO(torikatsu): add tmux, zsh
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-calc' },
        { 'uga-rosa/cmp-dictionary' },
        { 'dmitmel/cmp-digraphs' },
        { 'hrsh7th/cmp-omni' },
        { 'f3fora/cmp-spell' },
        { 'hrsh7th/cmp-nvim-lsp' }, -- depend on built-in lsp
        { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
        { 'hrsh7th/cmp-nvim-lsp-signature-help' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'dmitmel/cmp-cmdline-history' },
        { 'hrsh7th/cmp-emoji' }, -- TODO(torikatsu): configure
        {
          'ray-x/cmp-treesitter',
          requires = {
            'nvim-treesitter/nvim-treesitter'
          }
        },
        {
          'saadparwaiz1/cmp_luasnip',
          requires = {
            {
              'L3MON4D3/LuaSnip',
              config = require 'plugin.luasnip_rc',
              requires = {
                'rafamadriz/friendly-snippets'
              }
            }

          }
        },
      },
    }
    use {
      "glepnir/lspsaga.nvim",
      config = require 'plugin.lspsaga_rc',
      requires = {
        'neovim/nvim-lspconfig'
      },
    }
    use {
      'nvim-telescope/telescope.nvim',
      config = require 'plugin.telescope_rc',
      requires = {
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
        {
          'nvim-telescope/telescope-frecency.nvim',
          requires = {
            { 'tami5/sqlite.lua' }
          }
        },
      },
    }
    use {
      'nvim-treesitter/nvim-treesitter',
      config = require 'plugin.nvim-treesitter_rc',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
      requires = {
        { 'JoosepAlviste/nvim-ts-context-commentstring' },
        { 'p00f/nvim-ts-rainbow' },
        {
          'haringsrob/nvim_context_vt',
          config = require 'plugin.nvim-context-vt_rc',
        },
        {
          'm-demare/hlargs.nvim',
          config = require 'plugin.hlargs_rc'
        },
        {
          'windwp/nvim-ts-autotag',
          config = require 'plugin.autotag_rc'
        },
        {
          'windwp/nvim-autopairs',
          config = require 'plugin.autopairs_rc'
        },
        { 'andymass/vim-matchup' },
        { "yioneko/nvim-yati" },
      },
    }
    use {
      'petertriho/nvim-scrollbar',
      config = require 'plugin.nvim-scrollbar_rc'
    }
    use {
      'phaazon/hop.nvim',
      config = require 'plugin.hop_rc',
      branch = 'v2',

    }
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = require 'plugin.indent-blankline_rc'
    }
    use {
      "folke/todo-comments.nvim",
      config = require 'plugin.todo-comments_rc',
      requires = {
        'nvim-lua/plenary.nvim',
        'folke/trouble.nvim', -- TODO(torikatsu): configure
        'nvim-telescope/telescope.nvim', -- TODO(torikatsu): configure
      },
    }
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

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  },
})
