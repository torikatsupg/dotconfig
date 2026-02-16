--------------------------------------------------------------------------------
-- エディタ拡張プラグイン
-- テキスト編集機能を強化するプラグイン群
--------------------------------------------------------------------------------

return {
  ------------------------------------------------------------------------------
  -- vim-surround: テキスト囲み操作
  -- 括弧やクォートで囲む・囲みを変更・削除
  -- ds" 囲みを削除 / cs"' 囲みを変更 / ys<motion>" 囲みを追加
  ------------------------------------------------------------------------------
  {
    'tpope/vim-surround',
    keys = {
      { 'ds', desc = 'Delete surrounding' },
      { 'cs', desc = 'Change surrounding' },
      { 'cS', desc = 'Change surrounding (newline)' },
      { 'ys', desc = 'Add surrounding' },
      { 'yS', desc = 'Add surrounding (newline)' },
      { 'yss', desc = 'Add surrounding to line' },
      { 'S', mode = 'x', desc = 'Add surrounding (visual)' },
    },
    dependencies = { 'tpope/vim-repeat' },
  },

  ------------------------------------------------------------------------------
  -- vim-repeat: ドット繰り返し対応
  -- プラグインの操作も.で繰り返し可能に
  ------------------------------------------------------------------------------
  {
    'tpope/vim-repeat',
    lazy = true,
  },

  ------------------------------------------------------------------------------
  -- CamelCaseMotion: キャメルケース移動
  -- CamelCaseやsnake_caseの単語単位で移動
  -- Option+w/b/eで移動
  ------------------------------------------------------------------------------
  {
    'bkad/CamelCaseMotion',
    keys = {
      { '∑', '<Plug>CamelCaseMotion_w', mode = { 'n', 's' }, desc = 'CamelCase word' },
      { '∫', '<Plug>CamelCaseMotion_b', mode = { 'n', 's' }, desc = 'CamelCase back' },
      { '´', '<Plug>CamelCaseMotion_e', mode = { 'n', 's' }, desc = 'CamelCase end' },
      { 'g´', '<Plug>CamelCaseMotion_ge', mode = { 'n', 's' }, desc = 'CamelCase ge' },
      { 'i∑', '<Plug>CamelCaseMotion_iw', mode = { 'o', 'x' }, desc = 'CamelCase inner word' },
      { 'i∫', '<Plug>CamelCaseMotion_ib', mode = { 'o', 'x' }, desc = 'CamelCase inner back' },
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
}
