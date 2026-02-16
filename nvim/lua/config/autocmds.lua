--------------------------------------------------------------------------------
-- Autocommands
--------------------------------------------------------------------------------

local api = vim.api

--------------------------------------------------------------------------------
-- shada遅延読み込み
-- コマンドライン使用時まで読み込みを遅延して起動を高速化
--------------------------------------------------------------------------------
vim.opt.shada = ""

local shada_group = api.nvim_create_augroup('ShadaLazyLoad', { clear = true })
api.nvim_create_autocmd('CmdlineEnter', {
  group = shada_group,
  callback = function()
    api.nvim_del_augroup_by_name('ShadaLazyLoad')
    vim.opt.shada = "'0,:50"
    vim.cmd([[rshada ~/.local/state/nvim/shada/main.shada]])
  end,
  desc = 'Lazy load shada on first command line entry',
})

--------------------------------------------------------------------------------
-- ディレクトリ引数処理
-- nvim <directory> で起動した場合、そのディレクトリに移動
--------------------------------------------------------------------------------
local args = vim.fn.argv()
if #args > 0 then
  local stat = vim.loop.fs_stat(args[1])
  if stat and stat.type == 'directory' then
    vim.cmd('cd ' .. vim.fn.fnameescape(args[1]))
  end
end
