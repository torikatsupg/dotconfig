local packer
Fn = vim.fn
local function init()
  local path = Fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if Fn.empty(Fn.glob(path)) > 0 then
    Fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', path })
    vim.cmd [[packadd packer.nvim]]
  end
  if packer == nil then
    packer = require 'packer'
  end
  packer.init({
    disable_commands = true,
    display = { open_fn = require 'packer.util'.float },
    profile = {
      enable = false,
    }
  })

  packer.reset()
  local use = packer.use
  local configs = {
    '_packer',
    '_bufferline',
    '_camel_case_motion',
    '_cmp',
    '_colorizer',
    '_indent_blankline',
    '_lspsaga',
    '_neotree',
    '_noice',
    '_nvim_scrollbar',
    '_telescope',
    '_treesitter',
    '_vim_surround',
    '_deepl',
    'foundations',
    'others',
  }

  for _, config in ipairs(configs) do
    for _, plugin in pairs(require(config .. '.plugins')) do
      use(plugin)
    end
  end
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

local b = { bang = true }
local cmd = vim.api.nvim_create_user_command
local prefix = "Packer"
cmd(prefix .. "Clean", function() plugins.clean() end, b)
cmd(prefix .. "Compile", function() plugins.compile() end, b)
cmd(prefix .. "Install", function() plugins.install() end, b)
cmd(prefix .. "Status", function() plugins.status() end, b)
cmd(prefix .. "Sync", function() plugins.sync() end, b)
cmd(prefix .. "Update", function() plugins.update() end, b)

local disable_plugins = {
  'loaded_2html_plugin',
  'loaded_gzip',
  'loaded_tar',
  'loaded_tarPlugin',
  'loaded_zip',
  'loaded_zipPlugin',
  'loaded_vimball',
  'loaded_vimballPlugin',
  'loaded_netrw',
  'loaded_netrwPlugin',
  'loaded_netrwSettings',
  'loaded_netrwFileHandlers',
  'loaded_getscript',
  'loaded_getscriptPlugin',
  'loaded_man',
  'loaded_matchit',
  'loaded_matchparen',
  'loaded_shada_plugin',
  'loaded_spellfile_plugin',
  'loaded_tutor_mode_plugin',
  'loaded_rrhelper',
  'did_install_default_menus',
  'did_install_syntax_menu',
  'skip_loading_mswin',
  'did_indent_on',
  'did_load_ftplugin',
  'did_ftplugin'
}
for _, value in ipairs(disable_plugins) do
  vim.g[value] = true
end

local o = vim.opt
for _, v in ipairs({ 'nu', 'ru', 'sm', 'hid', 'et', 'si', 'tgc', 'hls', 'is', 'ic', 'scs', 'inf', }) do
  o[v] = true
end
o.ts = 2
o.sw = 2
o.enc = 'utf-8'
o.ve = 'block'
o.cb = 'unnamedplus'
o.cot = 'noselect'
o.scl = 'yes'
o.ch = 0
o.ls = 0


o.sd = ""
local ag = 'cmdentergroup'
local api = vim.api
api.nvim_create_augroup(ag, {})
api.nvim_create_autocmd('CmdlineEnter', {
  group = ag,
  callback = function()
    api.nvim_del_augroup_by_name(ag)
    vim.o.sd = "'0,:50"
    vim.cmd [[rshada ~/.local/state/nvim/shada/main.shada]]
  end
})
vim.env.LANG = 'C'

local args = Fn.argv()
if #args > 0 then
  local stat = vim.loop.fs_stat(args[1])
  if stat and stat.type == 'directory' then
    vim.cmd('cd ' .. Fn.fnameescape(args[1]))
  end
end
