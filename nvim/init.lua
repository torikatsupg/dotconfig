local packer
local function init()
  local fn = vim.fn
  local path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', path })
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
  'did_install_default_menus',
  'did_install_syntax_menu',
  'skip_loading_mswin',
  'did_indent_on',
  'did_load_ftplugin',
  'loaded_rrhelper',
  'did_ftplugin'
}
for _, value in ipairs(disable_plugins) do
  vim.g[value] = true
end

local o = vim.opt
for _, v in ipairs({
  'number',
  'ruler',
  'showmatch',
  'hidden',
  'expandtab',
  'smartindent',
  'termguicolors',
  'hlsearch',
  'incsearch',
  'ignorecase',
  'smartcase',
  'infercase',
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

