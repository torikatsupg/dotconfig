--------------------------------------------------------------------------------
-- Telescopeプラグイン
-- ファジーファインダーとその拡張
--------------------------------------------------------------------------------

return {
  ------------------------------------------------------------------------------
  -- telescope.nvim: ファジーファインダー
  -- ファイル、バッファ、grepなど様々な検索をファジーに実行
  ------------------------------------------------------------------------------
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    keys = {
      -- 基本機能（Option+f プレフィックス）
      { 'ƒƒ', function() require('telescope.builtin').find_files({}) end, desc = 'Find files' },
      { 'ƒ…', function() require('telescope.builtin').command_history({}) end, desc = 'Command history' },
      { 'ƒ˙', function() require('telescope.builtin').help_tags({}) end, desc = 'Help tags' },
      { 'ƒµ', function() require('telescope.builtin').marks({}) end, desc = 'Marks' },
      { 'ƒ∆', function() require('telescope.builtin').jumplist({}) end, desc = 'Jumplist' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    build = 'brew install ripgrep && brew install fd',
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          prompt_prefix = '🔍',
          mappings = {
            n = { q = actions.close },
            i = { ['<Esc>'] = actions.close },
          },
        },
      })

      -- quickfixでEnter後に自動で閉じる
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'qf',
        command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]],
      })
    end,
  },

  ------------------------------------------------------------------------------
  -- telescope-ghq.nvim: ghqプロジェクト検索
  -- ghqで管理しているリポジトリを検索・移動
  ------------------------------------------------------------------------------
  {
    'nvim-telescope/telescope-ghq.nvim',
    keys = {
      {
        'ƒœ',
        function()
          local t = require('telescope')
          t.load_extension('ghq')
          return t.extensions.ghq.list()
        end,
        desc = 'GHQ list',
      },
    },
    dependencies = { 'nvim-telescope/telescope.nvim' },
    build = 'brew install ghq',
  },

  ------------------------------------------------------------------------------
  -- telescope-frecency.nvim: 頻度ベースファイル検索
  -- よく使うファイルを優先して表示
  ------------------------------------------------------------------------------
  {
    'nvim-telescope/telescope-frecency.nvim',
    keys = {
      {
        'ƒ®',
        function()
          local t = require('telescope')
          t.load_extension('frecency')
          return t.extensions.frecency.frecency()
        end,
        desc = 'Frecency',
      },
    },
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'kkharji/sqlite.lua',
    },
  },

  ------------------------------------------------------------------------------
  -- telescope-live-grep-args.nvim: 高度なgrep検索
  -- ripgrepのオプションを指定してgrep検索
  ------------------------------------------------------------------------------
  {
    'nvim-telescope/telescope-live-grep-args.nvim',
    keys = {
      {
        'ƒ©',
        function()
          local t = require('telescope')
          t.load_extension('live_grep_args')
          return t.extensions.live_grep_args.live_grep_args()
        end,
        desc = 'Live grep args',
      },
    },
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  ------------------------------------------------------------------------------
  -- telescope-media-files.nvim: メディアファイルプレビュー
  -- 画像などのメディアファイルをプレビュー表示
  ------------------------------------------------------------------------------
  {
    'nvim-telescope/telescope-media-files.nvim',
    keys = {
      {
        'ƒM',
        function()
          local t = require('telescope')
          t.load_extension('media_files')
          return t.extensions.media_files.media_files()
        end,
        desc = 'Media files',
      },
    },
    dependencies = { 'nvim-telescope/telescope.nvim' },
    build = 'brew install chafa imagemagick ffmpegthumbnailer poppler',
  },

  ------------------------------------------------------------------------------
  -- telescope-ui-select.nvim: UIセレクター置換
  -- vim.ui.selectをTelescopeのUIで置き換え
  ------------------------------------------------------------------------------
  {
    'nvim-telescope/telescope-ui-select.nvim',
    keys = {
      {
        'ƒå',
        function(...)
          require('telescope._extensions.ui-select')
          vim.lsp.buf.code_action(...)
        end,
        desc = 'Code action (ui-select)',
      },
    },
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      local t = require('telescope')
      t.setup({
        extensions = {
          ['ui-select'] = { require('telescope.themes').get_cursor() },
        },
      })
      t.load_extension('ui-select')
    end,
  },

  ------------------------------------------------------------------------------
  -- sqlite.lua: SQLiteバインディング
  -- telescope-frecency等が使用するデータベース
  ------------------------------------------------------------------------------
  {
    'kkharji/sqlite.lua',
    lazy = true,
  },
}
