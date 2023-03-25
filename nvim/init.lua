local disable_plugins = {
  'loaded_2html_plugin',
  'loaded_gzip',
  'loaded_tar',
  'loaded_tarPlugin',
  'loaded_zip',
  'loaded_zipPlugin',
  'loaded_vimball',
  'loaded_vimballPlugin',
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
  'did_install_default_menus',
  'did_install_syntax_menu',
  'skip_loading_mswin',
  'did_indent_on',
  'did_load_ftplugin',
  'loaded_rrhelper',
}
for _, value in ipairs(disable_plugins) do
  vim.g[value] = true
end

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  else
    return false
  end
end

local packer
local function init()
  ensure_packer()
  if packer == nil then
    packer = require('packer')
  end

  packer.init({
    disable_commands = true,
    display = { open_fn = require('packer.util').float },
    profile = {
      enable = false,
    }
  })

  packer.reset()
  local use = packer.use
  use {
    'wbthomason/packer.nvim',
    commit = '1d0cf98a561f7fd654c970c49f917d74fafe1530',
    opt = true,
  }
  local configs = {
    '_bufferline.plugins',
    '_camel_case_motion.plugins',
    '_cmp.plugins',
    '_colorizer.plugins',
    '_indent_blankline.plugins',
    '_lspsaga.plugins',
    '_neotree.plugins',
    '_noice.plugins',
    '_nvim_scrollbar.plugins',
    '_telescope.plugins',
    '_treesitter.plugins',
    '_vim_surround.plugins',
    'foundations.plugins',
    'others.plugins',
  }
  for _, config in ipairs(configs) do
    for _, plugin in pairs(require(config)) do
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
cmd("PackerClean", function() plugins.clean() end, b)
cmd("PackerCompile", function() plugins.compile() end, b)
cmd("PackerInstall", function() plugins.install() end, b)
cmd("PackerRemove", [[:! rm -rf ~/.local/share/nvim]], b)
cmd("PackerStatus", function() plugins.status() end, b)
cmd("PackerSync", function() plugins.sync() end, b)
cmd("PackerUpdate", function() plugins.update() end, b)

local o = vim.opt
for _, v in ipairs({
'number',
'ruler',
'showmatch',
'hidden',
'wildmenu',
'expandtab',
'smartindent',
'termguicolors',
'hlsearch',
'incsearch',
'ignorecase',
'smartcase',
'infercase'
}) do
  o[v] = true
end
o.tabstop = 2
o.shiftwidth = 2
o.swapfile = false
o.encoding = 'utf-8'
o.virtualedit = 'block'
o.clipboard = 'unnamedplus'
o.completeopt = 'noselect'
o.signcolumn = 'yes'
o.cmdheight = 0
o.laststatus = 0
