--------------------------------------------------------------------------------
-- Treesitter拡張プラグイン
-- シンタックスハイライトの強化と関連機能
--------------------------------------------------------------------------------

return {
  ------------------------------------------------------------------------------
  -- nvim-ts-context-commentstring: コンテキスト対応コメント
  -- JSX内のコメントなど、コンテキストに応じたコメント文字列を使用
  ------------------------------------------------------------------------------
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = 'VimEnter',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
    config = function()
      require('ts_context_commentstring').setup({})
    end,
  },

  ------------------------------------------------------------------------------
  -- nvim_context_vt: コンテキスト仮想テキスト
  -- 閉じ括弧の横にスコープ情報を表示（例: --> if condition）
  ------------------------------------------------------------------------------
  {
    'haringsrob/nvim_context_vt',
    event = 'VimEnter',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim_context_vt').setup({
        enabled = true,
        disable_ft = { 'markdown' },
        disable_virtual_lines_ft = { 'yaml' },
        custom_parser = function(node, ft, opts)
          local utils = require('nvim_context_vt.utils')
          if node:type() == 'function' then
            return nil
          end
          return '--> ' .. utils.get_node_text(node)[1]
        end,
      })
    end,
  },

  ------------------------------------------------------------------------------
  -- nvim-ts-rainbow2: 括弧の虹色表示
  -- ネストした括弧を色分けして表示
  ------------------------------------------------------------------------------
  {
    'HiPhish/nvim-ts-rainbow2',
    event = 'BufRead',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  ------------------------------------------------------------------------------
  -- hlargs.nvim: 関数引数ハイライト
  -- 関数の引数を特別な色でハイライト
  ------------------------------------------------------------------------------
  {
    'm-demare/hlargs.nvim',
    event = 'BufRead',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },

  ------------------------------------------------------------------------------
  -- nvim-ts-autotag: HTMLタグ自動補完
  -- HTMLタグの自動閉じと自動リネーム
  ------------------------------------------------------------------------------
  {
    'windwp/nvim-ts-autotag',
    event = 'BufRead',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },

  ------------------------------------------------------------------------------
  -- nvim-autopairs: 括弧自動補完
  -- 括弧やクォートの自動ペアリング
  ------------------------------------------------------------------------------
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { 'TelescopePrompt' },
        check_ts = true,
      })
      -- cmpとの連携
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  ------------------------------------------------------------------------------
  -- vim-matchup: 拡張括弧マッチング
  -- %ジャンプを強化し、if-endなどにも対応
  ------------------------------------------------------------------------------
  {
    'andymass/vim-matchup',
    event = 'CursorHold',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
      require('nvim-treesitter.configs').setup({
        matchup = { enable = true },
      })
    end,
  },

  ------------------------------------------------------------------------------
  -- nightfox.nvim: カラースキーム
  -- Duskfoxテーマを使用（透過背景）
  ------------------------------------------------------------------------------
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nightfox').setup({
        options = { transparent = true },
      })
      vim.cmd.colorscheme('duskfox')
    end,
  },
}
