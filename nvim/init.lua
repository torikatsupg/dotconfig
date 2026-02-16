--------------------------------------------------------------------------------
-- init.lua
-- Neovim設定のエントリポイント
--------------------------------------------------------------------------------

-- Leader keyの設定（lazy.nvim読み込み前に必要）
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- 設定モジュールの読み込み
require('config.options')   -- Vimオプション
require('config.keymaps')   -- グローバルキーマップ
require('config.autocmds')  -- Autocommands

-- プラグインマネージャー初期化
require('config.lazy')
