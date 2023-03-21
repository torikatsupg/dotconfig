-- # configurations for foundation
vim.opt.encoding = 'utf-8'
vim.opt.number = true
vim.opt.ruler = true
vim.opt.showmatch = true

vim.opt.list = true
vim.opt.listchars:append 'tab:»-'
vim.opt.listchars:append 'trail:-'
-- vim.opt.listchars:append 'eol:↲'
vim.opt.listchars:append 'extends:»'
vim.opt.listchars:append 'precedes:«'
vim.opt.listchars:append 'nbsp:%'
-- vim.opt.listchars:append "space:⋅"

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


-- TODO(torikatsu): keymap in completion window
