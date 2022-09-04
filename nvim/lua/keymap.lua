-- neotree
local opts = { noremap = true, silent = true }
local neo_tree = require'neo-tree'
vim.keymap.set('n', '<leader><space>', function() vim.cmd[[NeoTreeFloat]] end, opts)

-- lsp
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- hop
local hop = require 'hop'
vim.keymap.set("n", "<leader>f", hop.hint_char1, opts)

-- telescope
local builtin = require("telescope.builtin")
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)

