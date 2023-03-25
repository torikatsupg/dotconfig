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
    'foundations.plugins',
    '_treesitter.plugins',
    '_telescope.plugins',
    'cmp.plugins',
    'noice.plugins',
    'bufferline.plugins',
    'colorizer.plugins',
    'lspsaga.plugins',
    '_nvim_scrollbar.plugins',
    'indent_blankline.plugins',
    'camel_case_motion.plugins',
    'vim_surround.plugins',
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

local cmd = vim.api.nvim_create_user_command
cmd("PackerInstall", function() plugins.install() end, { bang = true })
cmd("PackerUpdate", function() plugins.update() end, { bang = true })
cmd("PackerSync", function() plugins.sync() end, { bang = true })
cmd("PackerClean", function() plugins.clean() end, { bang = true })
cmd("PackerCompile", function() plugins.compile() end, { bang = true })
cmd("PackerRemove", [[:! rm -rf ~/.local/share/nvim]], { bang = true })
cmd("PackerStatus", function() plugins.status() end, { bang = true })

local opt = vim.opt
opt.encoding = 'utf-8'
opt.number = true
opt.ruler = true
opt.showmatch = true
opt.hidden = true
opt.virtualedit = 'block'
opt.wildmenu = true
opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.termguicolors = true
opt.clipboard = 'unnamedplus'
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.swapfile = false
opt.completeopt = 'noselect'
opt.signcolumn = 'yes'
opt.cmdheight = 0
opt.laststatus = 0
