--------------------------------------------------------------------------------
-- エディタ拡張プラグイン
-- テキスト編集機能を強化するプラグイン群
--------------------------------------------------------------------------------

return {
  ------------------------------------------------------------------------------
  -- nvim-surround: テキスト囲み操作（Luaネイティブ）
  -- 括弧やクォートで囲む・囲みを変更・削除
  -- ds" 囲みを削除 / cs"' 囲みを変更 / ys<motion>" 囲みを追加
  -- dot-repeat内蔵のためvim-repeat不要
  ------------------------------------------------------------------------------
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    opts = {},
  },

  ------------------------------------------------------------------------------
  -- nvim-spider: サブワード移動（Luaネイティブ）
  -- CamelCaseやsnake_caseの単語単位で移動
  -- Option+w/b/eで移動
  ------------------------------------------------------------------------------
  {
    'chrisgrieser/nvim-spider',
    keys = {
      { '∑', function() require('spider').motion('w') end, mode = { 'n', 'o', 'x' }, desc = 'Spider w' },
      { '∫', function() require('spider').motion('b') end, mode = { 'n', 'o', 'x' }, desc = 'Spider b' },
      { '´', function() require('spider').motion('e') end, mode = { 'n', 'o', 'x' }, desc = 'Spider e' },
      { 'g´', function() require('spider').motion('ge') end, mode = { 'n', 'o', 'x' }, desc = 'Spider ge' },
    },
  },

  ------------------------------------------------------------------------------
  -- nvim-colorizer.lua: カラーコード可視化
  -- #FFFFFFなどのカラーコードを実際の色で表示
  ------------------------------------------------------------------------------
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufRead',
    opts = {
      user_default_options = {
        mode = 'virtualtext',
      },
    },
  },

  ------------------------------------------------------------------------------
  -- indent-blankline.nvim: インデントガイド
  -- インデントレベルを視覚的に表示
  ------------------------------------------------------------------------------
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    main = 'ibl',
    opts = {
      scope = { enabled = true },
    },
  },

  ------------------------------------------------------------------------------
  -- nvim-scrollbar: スクロールバー表示
  -- 検索結果やエラー位置をスクロールバーに表示
  ------------------------------------------------------------------------------
  {
    'petertriho/nvim-scrollbar',
    event = 'BufRead',
    dependencies = { 'kevinhwang91/nvim-hlslens' },
    config = function()
      -- hlslens設定（検索マッチ数を非表示）
      require('hlslens').setup({
        override_lens = function(render, _, _, _, _)
          render.setVirt(0, 0, 0, {}, {})
        end,
      })
      require('scrollbar').setup()
      require('scrollbar.handlers.search').setup()
    end,
  },

  ------------------------------------------------------------------------------
  -- nvim-hlslens: 検索マッチハイライト強化
  -- 検索結果のハイライトとマッチ数表示
  ------------------------------------------------------------------------------
  {
    'kevinhwang91/nvim-hlslens',
    lazy = true,
  },

  ------------------------------------------------------------------------------
  -- deepl.nvim: DeepL翻訳
  -- 選択テキストをDeepLで翻訳（Ctrl+t）
  ------------------------------------------------------------------------------
  {
    'torikatsupg/deepl.nvim',
    keys = {
      {
        '<C-t>',
        function()
          vim.env.deepl_nvim_apikey = ''
          require('deepl').translate()
        end,
        mode = 'v',
        desc = 'Translate with DeepL',
      },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  ------------------------------------------------------------------------------
  -- emmet-vim: HTML/JSX高速入力
  -- 省略記法からHTML/JSXを展開（例: div.container>ul>li*3）
  -- <C-y>, で展開
  ------------------------------------------------------------------------------
  {
    'mattn/emmet-vim',
    ft = { 'html', 'css', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' },
    init = function()
      vim.g.user_emmet_leader_key = '<C-y>'
    end,
  },
}
