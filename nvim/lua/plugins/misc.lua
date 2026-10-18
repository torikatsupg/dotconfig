--------------------------------------------------------------------------------
-- その他のプラグイン
-- カテゴリに属さないユーティリティプラグイン群
--------------------------------------------------------------------------------

-- NOTE: Neovim 0.10以降、ビルトインでgc/gccコメント機能があるため
--       Comment.nvim と vim-context-commentstring は不要

return {
  ------------------------------------------------------------------------------
  -- vim-better-whitespace: 末尾空白可視化
  -- 行末の不要な空白をハイライト表示
  ------------------------------------------------------------------------------
  {
    'ntpeters/vim-better-whitespace',
    event = 'BufRead',
  },

  ------------------------------------------------------------------------------
  -- gitsigns.nvim: Git差分表示
  -- 行単位のGit差分をサイン列に表示、行blame表示
  ------------------------------------------------------------------------------
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    opts = {
      current_line_blame = true,
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    },
  },

  ------------------------------------------------------------------------------
  -- which-key.nvim: キーバインドヘルプ
  -- キー入力後に続くキーバインドをポップアップ表示
  ------------------------------------------------------------------------------
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      -- v3形式の設定
      preset = 'classic',
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  },

  ------------------------------------------------------------------------------
  -- auto-save.nvim: 自動保存
  -- InsertLeave時に自動的にファイルを保存（Luaネイティブ）
  ------------------------------------------------------------------------------
  {
    'okuuva/auto-save.nvim',
    event = { 'InsertLeave', 'TextChanged' },
    opts = {
      trigger_events = {
        immediate_save = {},
        defer_save = { 'InsertLeave' },
      },
    },
  },

  ------------------------------------------------------------------------------
  -- todo-comments.nvim: TODO/FIXMEハイライト
  -- TODO, FIXME, HACK等をハイライト表示しTelescope検索可能
  ------------------------------------------------------------------------------
  {
    'folke/todo-comments.nvim',
    event = 'BufRead',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ft', '<cmd>TodoTelescope<CR>', desc = 'Search TODOs (Telescope)' },
      { '<leader>xt', '<cmd>Trouble todo toggle<CR>', desc = 'TODOs (Trouble)' },
    },
    opts = {},
  },

  ------------------------------------------------------------------------------
  -- lazygit.nvim: lazygit統合
  -- Neovim内でlazygitを起動してGit操作
  ------------------------------------------------------------------------------
  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
    keys = {
      { '<leader>gg', '<cmd>LazyGit<CR>', desc = 'LazyGit' },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
