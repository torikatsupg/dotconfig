--------------------------------------------------------------------------------
-- lazy.nvim ブートストラップと設定
--------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- lazy.nvimが未インストールの場合、自動でclone
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- lazy.nvimの初期化
require('lazy').setup('plugins', {
  -- インストール時のカラースキーム
  install = {
    colorscheme = { 'duskfox' },
  },

  -- 更新チェック（手動更新を推奨）
  checker = {
    enabled = false,
  },

  -- ファイル変更検知
  change_detection = {
    notify = false,
  },

  -- パフォーマンス設定
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      -- 無効化するビルトインプラグイン
      disabled_plugins = {
        '2html_plugin',
        'getscript',
        'getscriptPlugin',
        'gzip',
        'matchit',
        'matchparen',
        'netrw',
        'netrwFileHandlers',
        'netrwPlugin',
        'netrwSettings',
        'rrhelper',
        'spellfile_plugin',
        'tar',
        'tarPlugin',
        'tohtml',
        'tutor',
        'vimball',
        'vimballPlugin',
        'zip',
        'zipPlugin',
      },
    },
  },
})
