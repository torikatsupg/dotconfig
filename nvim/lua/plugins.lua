vim.cmd[[packadd packer.nvim]]

require 'packer'.startup(function(use)
  use { 'wbthomason/packer.nvim', opt = true }

  -- appearance
  use { 'EdenEast/nightfox.nvim' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      { 'EdenEast/nightfox.nvim' },
      { 'SmiteshP/nvim-navic' },
      { 'kyazdani42/nvim-web-devicons' },
    }
  }

  -- No Dependencies
  use { 'norcalli/nvim-colorizer.lua' }

  -- # lsp
  use { 'neovim/nvim-lspconfig' }

  use {
    'williamboman/mason.nvim',
    requires = {
      { 'neovim/nvim-lspconfig'},
      { 'williamboman/mason-lspconfig.nvim' },
    }
  }
  -- dap
  use { 'mfussenegger/nvim-dap' }
  use { 'rcarriga/nvim-dap-ui' }
  use { 'theHamsta/nvim-dap-virtual-text' }
  use { 'akinsho/flutter-tools.nvim' }

  --
  use { 'j-hui/fidget.nvim' }
  use {
    'folke/trouble.nvim',
    requires = {
      { 'folke/lsp-colors.nvim' }
    }
  }

  -- # completations
  use {
    'hrsh7th/nvim-cmp',
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
          requires =  {
          'L3MON4D3/LuaSnip'
        }
      },
    }
  }

  -- TODO(torikatsu): separate configurations
  use {
    "glepnir/lspsaga.nvim",
    requires = {
      'neovim/nvim-lspconfig'
    },
    config = function()
      local saga = require("lspsaga")
      saga.init_lsp_saga({})
    end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim' },
      {
        'nvim-telescope/telescope-frecency.nvim',
        requires = {
          { 'tami5/sqlite.lua' }
        }
      },
    }
  }

  -- NOTE(torikatsu): this plugins is not necessary, but it's required by vim-cmp
  -- use { 'L3MON4D3/LuaSnip' }

  -- TODO(torikatsu): separate configuration
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      { 'JoosepAlviste/nvim-ts-context-commentstring' },
      { 'p00f/nvim-ts-rainbow' },
      { 'haringsrob/nvim_context_vt' },
      { 'm-demare/hlargs.nvim' },
      { 'windwp/nvim-ts-autotag' },
      { 'windwp/nvim-autopairs' },
      { 'andymass/vim-matchup' },
      {
        "yioneko/nvim-yati",
        config = function()
          require("nvim-treesitter.configs").setup {
            yati = { enable = true },
          }
        end
      }
    }
  }

  -- TODO(torikatsu): separate configuration
  use {
    'petertriho/nvim-scrollbar',
    config = function()
      require("scrollbar").setup()
    end
  }

  use { 'phaazon/hop.nvim', branch = 'v2' }

  -- TODO(torikatsu): separate configuration
  use { 'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  }

  -- TODO(torikatsu): separate configuration
  use {
    "folke/todo-comments.nvim",
    requires = {
      'nvim-lua/plenary.nvim',
      'folke/trouble.nvim', -- TODO(torikatsu): configure
      'nvim-telescope/telescope.nvim', -- TODO(torikatsu): configure
    },
    config = function()
      require("todo-comments").setup {
        signs = true,
        sign_priority = 8, -- sign priority
        -- keywords recognized as todo comments
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        },
        merge_keywords = true,
      }
    end
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use { 'bkad/CamelCaseMotion' }
  use { 'myusuf3/numbers.vim' }
  use { 'tpope/vim-surround' }
  use { 'numToStr/Comment.nvim' }
  use { 'ntpeters/vim-better-whitespace' }
  -- TODO(torikatsu): いれたい https://github.com/segeljakt/vim-silicon

end)

