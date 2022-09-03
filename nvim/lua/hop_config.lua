require('hop').setup({ current_line_only = false })
local hop = require 'hop'

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>f", hop.hint_char1, opts)

