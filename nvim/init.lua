-- Disable TOhtml
vim.g.loaded_2html_plugin       = true

-- Disable archive file open and browse.
vim.g.loaded_gzip               = true
vim.g.loaded_tar                = true
vim.g.loaded_tarPlugin          = true
vim.g.loaded_zip                = true
vim.g.loaded_zipPlugin          = true

-- Disable vimball.
vim.g.loaded_vimball            = true
vim.g.loaded_vimballPlugin      = true

-- Disable netrw plugins.
-- vim.g.loaded_netrw              = true
vim.g.loaded_netrwPlugin        = true
vim.g.loaded_netrwSettings      = true
vim.g.loaded_netrwFileHandlers  = true

-- Disable `GetLatestVimScript`.
vim.g.loaded_getscript          = true
vim.g.loaded_getscriptPlugin    = true

-- Disable other plugins
vim.g.loaded_man                = true
vim.g.loaded_matchit            = true
vim.g.loaded_matchparen         = true
vim.g.loaded_shada_plugin       = true
vim.g.loaded_spellfile_plugin   = true
vim.g.loaded_tutor_mode_plugin  = true
vim.g.did_install_default_menus = true
vim.g.did_install_syntax_menu   = true
vim.g.skip_loading_mswin        = true
vim.g.did_indent_on             = true
vim.g.did_load_ftplugin         = true
vim.g.loaded_rrhelper           = true
--
--
-- plugins
-- foundation
-- keymap

-- Install packer
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

-- Dependencies
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

  -- Plugins

  use {
    'wbthomason/packer.nvim',
    commit = '1d0cf98a561f7fd654c970c49f917d74fafe1530',
    opt = true,
  }

  local foundations = require 'foundations.foundations'
  use(foundations.treesitter)
  use(foundations.nvim_lspconfig)

  local treesitter = require '_treesitter.plugins'
  use(treesitter.nvim_ts_context_commentstring)
  -- use(treesitter.nvim_context_vt)
  use(treesitter.nvim_ts_rainbow)
  use(treesitter.nvim_autopairs)
  use(treesitter.vim_matchup)
  use(treesitter.nightfox)
  use(treesitter.nvim_ts_autotag)
  use(treesitter.hlargs)

  local telescope = require 'telescope.plugins'
  use(telescope.telescope)
  use(telescope.ghq)
  use(telescope.frecency)
  use(telescope.live_grep_args)
  use(telescope.media_files)
  use(telescope.ui_select)

  local cmp = require 'cmp.plugins'
  use(cmp.buffer)
  use(cmp.path)
  use(cmp.dictionary)
  use(cmp.emoji)
  use(cmp.luasnip)
  use(cmp.nvim_lsp)
  use(cmp.cmp_cmdline)
  use(cmp.cmp_copilot)

  local noice = require 'noice.plugins'
  use(noice.noice)

  local bufferline = require 'bufferline.plugins'
  use(bufferline.bufferline)

  local colorizer = require 'colorizer.plugins'
  use(colorizer.nvim_colorizer)

  local lspsaga = require 'lspsaga.plugins'
  use(lspsaga.lspsaga)

  local nvim_scrollbar = require'nvim_scrollbar.plugins'
  use(nvim_scrollbar.nvim_scrollbar)

  local indent_blankline = require 'indent_blankline.plugins'
  use(indent_blankline.indent_blankline)

  local camelcasemotion = require 'camel_case_motion.plugins'
  use(camelcasemotion.camel_case_motion)

  local vim_surround = require 'vim_surround.plugins'
  use(vim_surround.vim_surround)

  local others = require 'others.plugins'
  use(others.gitsigns)
  use(others.vim_auto_save)
  use(others.vim_better_whitespace)
  use(others.which_key_nvim)

  -- use {
  --   'phaazon/hop.nvim',
  --   config = require 'hop_rc',
  --   branch = 'v2',
  --
  -- }
  --

  -- use {
  --   "folke/todo-comments.nvim",
  --   config = require 'todo-comments_rc',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'folke/trouble.nvim',            -- TODO(torikatsu): configure
  --     'nvim-telescope/telescope.nvim', -- TODO(torikatsu): configure
  --   },
  -- }



end

-- Define ex commands
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


-- fundation
vim.opt.encoding = 'utf-8'
vim.opt.number = true
vim.opt.ruler = true
vim.opt.showmatch = true

-- vim.opt.list = true

vim.opt.hidden = true
vim.opt.virtualedit = 'block'
vim.opt.wildmenu = true
-- 表示崩れの下になるの指定しない
-- vim.opt.ambiwidth = 'double'
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.list = true
vim.opt.termguicolors = true

-- vim.opt.foldmethod='indent'
-- vim.opt.nofoldenable=true

-- vim.g.camelcasemotion_key = '<leader>'

-- vim.opt.cmdheight = 0
vim.opt.clipboard = 'unnamedplus'

--
vim.opt.encoding = 'utf-8'
vim.opt.ruler = true
vim.opt.number = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true
vim.opt.swapfile = false

vim.opt.completeopt = 'noselect'

vim.opt.signcolumn = 'yes'
vim.opt.cmdheight = 0
vim.opt.laststatus = 0


-- vim.opt.pumblend=50
-- vim.opt.winblend=50

-- TODO(torikatsu): keymap in completion window


-- keymap
local keymap = vim.keymap.set
local opts = { noremap = true, silent = false }

keymap('n', '<space>f', vim.lsp.buf.format, opts)
