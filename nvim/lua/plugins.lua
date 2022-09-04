local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require 'packer'.startup({
  function(use)
    use { 'wbthomason/packer.nvim', opt = true }
    use {
      'EdenEast/nightfox.nvim',
      config = require'plugin.nightfox_rc'
    }
    use {
      'nvim-lualine/lualine.nvim',
      config = require'plugin.lualine_rc',
      requires = {
        { 'EdenEast/nightfox.nvim' },
        { 'SmiteshP/nvim-navic' },
        { 'kyazdani42/nvim-web-devicons' },
      },
    }
    use {
      'j-hui/fidget.nvim',
      config = require'plugin.fidget_rc'
    }
    -- TODO(torikatsu): 入れる
    -- use { 'norcalli/nvim-colorizer.lua' }
    use {
      'neovim/nvim-lspconfig',
      config = require'plugin.nvim-lspconfig_rc'
    }
    use {
      'williamboman/mason.nvim',
      config = require'plugin.mason-lspconfig_rc',
      requires = {
        { 'neovim/nvim-lspconfig'},
        { 'williamboman/mason-lspconfig.nvim' },
      },
    }
    -- dap
    use {
      'mfussenegger/nvim-dap',
      config = require'plugin.dap_rc'
    }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'theHamsta/nvim-dap-virtual-text' }
    use {
      'akinsho/flutter-tools.nvim',
      config = require'plugin.flutter-tools_rc',
    }

    use {
      'folke/trouble.nvim',
      config = require'plugin.trouble_rc',
      requires = {
        { 'folke/lsp-colors.nvim' },
      },
    }
    use {
      'hrsh7th/nvim-cmp',
      config = require'plugin.nvim-cmp_rc',
      requires = {
        -- TODO(torikatsu): add fuzz_buffer, fuzzy_path, rg
        -- TODO(torikatsu): add tmux, zsh
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-calc' },
        { 'uga-rosa/cmp-dictionary' },
        { 'dmitmel/cmp-digraphs' },
        { 'hrsh7th/cmp-omni' },
        { 'f3fora/cmp-spell' },
        {
          'hrsh7th/cmp-nvim-lsp',
          config = require'plugin.cmp-nvim-lsp_rc'
        }, -- depend on built-in lsp
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
          requires =  {
            'L3MON4D3/LuaSnip'
          }
        },
      },
    }
    -- TODO(torikatsu): separate configurations
    use {
      "glepnir/lspsaga.nvim",
      config = require'plugin.lspsaga_rc',
      requires = {
        'neovim/nvim-lspconfig'
      },
    }

    use {
      'nvim-telescope/telescope.nvim',
      config = require'plugin.telescope_rc',
      requires = {
        { 'nvim-telescope/telescope-fzf-native.nvim' },
        {
          'nvim-telescope/telescope-frecency.nvim',
          requires = {
            { 'tami5/sqlite.lua' }
          }
        },
      },
    }
    -- NOTE(torikatsu): this plugins is not necessary, but it's required by vim-cmp
    -- use { 'L3MON4D3/LuaSnip' }
    -- TODO(torikatsu): separate configuration
    use {
      'nvim-treesitter/nvim-treesitter',
      config = require'plugin.nvim-treesitter_rc',
      requires = {
        { 'JoosepAlviste/nvim-ts-context-commentstring' },
        { 'p00f/nvim-ts-rainbow' },
        {
          'haringsrob/nvim_context_vt',
          config = require'plugin.nvim-context-vt_rc',
        },
        {
          'm-demare/hlargs.nvim',
          config = require'plugin.hlargs_rc'
        },
        {
          'windwp/nvim-ts-autotag',
          config = require'plugin.autotag_rc'
        },
        {
          'windwp/nvim-autopairs',
          config = require'plugin.autopairs_rc'
        },
        { 'andymass/vim-matchup' },
        { "yioneko/nvim-yati" },
      },
    }
    use {
      'petertriho/nvim-scrollbar',
      config = require'plugin.nvim-scrollbar_rc'
    }
    use {
      'phaazon/hop.nvim',
      config = require'plugin.hop_rc',
      branch = 'v2',

    }
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = require'plugin.indent-blankline_rc'
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
      config = require'plugin.neo-tree_rc',
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      },
    }
    use { 'bkad/CamelCaseMotion' }
    use { 'myusuf3/numbers.vim' }
    use { 'tpope/vim-surround' }
    use { 'numToStr/Comment.nvim' }
    use { 'ntpeters/vim-better-whitespace' }
    -- TODO(torikatsu): いれたい https://github.com/segeljakt/vim-silicon
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

