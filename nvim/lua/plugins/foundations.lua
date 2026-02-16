--------------------------------------------------------------------------------
-- 基盤プラグイン
-- 他のプラグインの依存関係として使用される共通ライブラリ群
--------------------------------------------------------------------------------

return {
  ------------------------------------------------------------------------------
  -- plenary.nvim: Luaユーティリティライブラリ
  -- 多くのプラグインが依存する基盤ライブラリ（非同期処理、パス操作等）
  ------------------------------------------------------------------------------
  {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },

  ------------------------------------------------------------------------------
  -- nvim-web-devicons: ファイルアイコン
  -- ファイルタイプに応じたアイコンを提供（Nerd Font必須）
  ------------------------------------------------------------------------------
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },

  ------------------------------------------------------------------------------
  -- nvim-treesitter: 高精度シンタックスハイライト
  -- ASTベースのシンタックス解析でハイライト、インデント、折りたたみを提供
  ------------------------------------------------------------------------------
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VimEnter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({})
    end,
  },

  ------------------------------------------------------------------------------
  -- mason.nvim: LSP/DAP/Linterインストーラー
  -- 言語サーバーやフォーマッターを簡単にインストール・管理
  ------------------------------------------------------------------------------
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    build = ':MasonUpdate',
    opts = {},
  },

  ------------------------------------------------------------------------------
  -- mason-lspconfig.nvim: MasonとLSPConfigの連携
  -- Masonでインストールしたサーバーを自動的にlspconfigに登録
  ------------------------------------------------------------------------------
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
    dependencies = { 'williamboman/mason.nvim' },
  },

  ------------------------------------------------------------------------------
  -- nvim-lspconfig: LSPクライアント設定
  -- 言語サーバーとの通信を設定し、補完・定義ジャンプ等を提供
  ------------------------------------------------------------------------------
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'LspInfo', 'LspLog' },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local lspconfig = require('lspconfig')
      require('mason').setup()
      local mason_lspconfig = require('mason-lspconfig')

      -- Neovim 0.11: vim.diagnostic.config()で診断設定を一元化
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      -- lua_ls用の設定を定義
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- Neovim 0.11: automatic_enable でMasonのサーバーを自動有効化
      mason_lspconfig.setup({
        ensure_installed = { 'lua_ls', 'rust_analyzer' },
        automatic_installation = true,
      })

      -- フォーマットキーマップ
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format()
        vim.cmd('EslintFixAll')
        vim.cmd('PrettierASync')
      end, { noremap = true, silent = false, desc = 'Format buffer' })
    end,
  },

  ------------------------------------------------------------------------------
  -- formatter.nvim: コードフォーマッター
  -- 様々な言語のフォーマッターを統一的に管理・実行
  ------------------------------------------------------------------------------
  {
    'mhartington/formatter.nvim',
    lazy = true,
  },

  ------------------------------------------------------------------------------
  -- LuaSnip: スニペットエンジン
  -- コード補完と連携し、スニペット展開を提供
  ------------------------------------------------------------------------------
  {
    'L3MON4D3/LuaSnip',
    lazy = true,
    build = 'make install_jsregexp',
    config = function()
      local ls = require('luasnip')
      local snip = ls.snippet
      local func = ls.function_node

      -- カスタムスニペット: 日付挿入
      local date = function()
        return { os.date('%Y-%m-%d') }
      end

      ls.add_snippets(nil, {
        all = {
          snip({
            trig = 'datedatedate',
            namr = 'Date',
            dscr = 'Date in the form of YYYY-MM-DD',
          }, {
            func(date, {}),
          }),
        },
      })
    end,
  },

  ------------------------------------------------------------------------------
  -- nui.nvim: UIコンポーネントライブラリ
  -- ポップアップやメニューなどのUI部品を提供（noice等が依存）
  ------------------------------------------------------------------------------
  {
    'MunifTanjim/nui.nvim',
    lazy = true,
  },
}
