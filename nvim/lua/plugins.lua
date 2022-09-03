vim.cmd[[packadd packer.nvim]]

require 'packer'.startup(function(use)
  -- # plugin manager
  use { 'wbthomason/packer.nvim', opt = true }

  use { 'nvim-lua/popup.nvim' }

  -- appearance
  use { 'EdenEast/nightfox.nvim' }
  use { 'nvim-lualine/lualine.nvim', }
  use { 'kyazdani42/nvim-web-devicons' }
  -- TODO(torikatsu): 通知いい感じに出せるやつ試したい
  -- use { 'rcarriga/nvim-notify' }
  use { 'SmiteshP/nvim-navic' }
  use { 'norcalli/nvim-colorizer.lua' }

  -- # lsp
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'folke/lsp-colors.nvim' }
  use { 'folke/trouble.nvim' }
  use { 'j-hui/fidget.nvim' }


  -- # completations
  use { 'hrsh7th/nvim-cmp', }
  -- for cmp-buffer
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-calc' }
  use { 'uga-rosa/cmp-dictionary' }
  use { 'dmitmel/cmp-digraphs' }
  use { 'hrsh7th/cmp-omni' }
  use { 'f3fora/cmp-spell' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'ray-x/cmp-treesitter' }
  -- for cmp-nvim-lsp
  use { 'hrsh7th/cmp-nvim-lsp-document-symbol' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'dmitmel/cmp-cmdline-history' }
  use { 'hrsh7th/cmp-emoji' }
  use { 'saadparwaiz1/cmp_luasnip' }
  -- # lsp ui
  use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require("lspsaga")

      saga.init_lsp_saga({
        -- your configuration
      })
    end,

  }
  -- # fuzzy finder
  use { 'nvim-telescope/telescope.nvim', }
  -- for telescope
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim' }
  use { "nvim-telescope/telescope-frecency.nvim" }
  -- for telescope frecency
  use { "tami5/sqlite.lua" }

  -- snipet
  use { 'L3MON4D3/LuaSnip' }

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter' }
  use { "yioneko/nvim-yati", config = function ()
    require("nvim-treesitter.configs").setup {
      yati = { enable = true },
    }

  end }

  -- scrollbar
  use {
    'petertriho/nvim-scrollbar' ,
    config = function ()
      require("scrollbar").setup()
    end
  }

  -- easy motion
  use { 'phaazon/hop.nvim', branch = 'v2' }


  use { 'lukas-reineke/indent-blankline.nvim',
    config = function ()
      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
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


  use { "MunifTanjim/nui.nvim" }
  use { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" }

  use { 'p00f/nvim-ts-rainbow' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'haringsrob/nvim_context_vt' }
  use { 'm-demare/hlargs.nvim' }
  use { 'bkad/CamelCaseMotion' }
  use { 'myusuf3/numbers.vim' }
  use { 'tpope/vim-surround' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'windwp/nvim-autopairs' }
  use { 'andymass/vim-matchup' }

  use { 'numToStr/Comment.nvim' }
  use { 'ntpeters/vim-better-whitespace' }

  -- TODO(torikatsu): いれたい https://github.com/segeljakt/vim-silicon


  -- dap
  use { 'mfussenegger/nvim-dap'}
  use { 'rcarriga/nvim-dap-ui' }
  use { 'theHamsta/nvim-dap-virtual-text' }

  use {'akinsho/flutter-tools.nvim' }


end)

require("nvim-treesitter.configs").setup {
  yati = { enable = true },
}

-- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
