local opts = { noremap = true, silent = true }
local neo_tree = require'neo-tree'

vim.keymap.set('n', '<leader><space>', function() vim.cmd[[NeoTreeFloat]] end, opts)
