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
  -- vim-auto-save: 自動保存
  -- InsertLeave時に自動的にファイルを保存
  ------------------------------------------------------------------------------
  {
    'vim-scripts/vim-auto-save',
    event = 'InsertLeave',
    config = function()
      vim.g.auto_save = 1
      vim.g.auto_save_silent = 1
      vim.g.auto_save_in_insert_mode = 0
      vim.g.auto_save_events = { 'InsertLeave' }
    end,
  },
}
