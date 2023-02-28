local keymap = vim.keymap.set
local opts = { noremap = true, silent = false }

-- neotree
keymap('n', '<leader><space>', function() vim.cmd [[NeoTreeFloat]] end, opts)

-- hop
local hop = require 'hop'
keymap("n", "<leader>f", hop.hint_char1, opts)

-- telescope
local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, opts)
keymap("n", "<leader>fg", builtin.live_grep, opts)
keymap("n", "<leader>fb", builtin.buffers, opts)
keymap("n", "<leader>fh", builtin.help_tags, opts)

-- lsp
-- keymap('n', '<space>e', vim.diagnostic.open_float, opts) TODO
-- keymap('n', '[d', vim.diagnostic.goto_prev, opts)
-- keymap('n', ']d', vim.diagnostic.goto_next, opts)
-- keymap('n', '<space>q', vim.diagnostic.setloclist, opts) TODO
-- keymap('n', 'gD', vim.lsp.buf.declaration, opts)
-- keymap('n', 'gd', vim.lsp.buf.definition, opts)
-- keymap('n', 'K', vim.lsp.buf.hover, opts)
-- keymap('n', 'gi', vim.lsp.buf.implementation, opts) TODO
-- keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
-- keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
-- keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
-- keymap('n', '<space>wl', function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, opts)
-- keymap('n', '<space>D', vim.lsp.buf.type_definition, opts)
-- keymap('n', '<space>rn', vim.lsp.buf.rename, opts)
-- keymap('n', '<space>ca', vim.lsp.buf.code_action, opts)
-- keymap('n', 'gr', vim.lsp.buf.references, opts)

keymap('n', '<space>f', vim.lsp.buf.format, opts)


-- lspsaga
keymap("n", "gh",           "<cmd>Lspsaga lsp_finder<CR>", opts)
keymap("n", "ga",           "<cmd>Lspsaga code_action<CR>")
keymap("v", "ga",           "<cmd>Lspsaga range_code_action<CR>", opts)
keymap("n", "gr",           "<cmd>Lspsaga rename<CR>", opts)
keymap("n", "gr",           "<cmd>Lspsaga rename ++project<CR>")
keymap("n", "gd",           "<cmd>Lspsaga peek_definition<CR>")
keymap("n", "gd",           "<cmd>Lspsaga goto_definition<CR>")
keymap("n", "gt",           "<cmd>Lspsaga peek_type_definition<CR>")
keymap("n", "gt",           "<cmd>Lspsaga goto_type_definition<CR>")

keymap("n", "<leader>sl",   "<cmd>Lspsaga show_line_diagnostics<CR>")
keymap("n", "<leader>sc",   "<cmd>Lspsaga show_cursor_diagnostics<CR>")
keymap("n", "<leader>sb",   "<cmd>Lspsaga show_buf_diagnostics<CR>")

keymap("n", "[e",           "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]e",           "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "[E",           function() require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, opts)
keymap("n", "]E",           function() require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR }) end, opts)
keymap("n", "K",            "<cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", "<Leader>ci",   "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co",   "<cmd>Lspsaga outgoing_calls<CR>")
keymap({"n", "t"}, "∂", "<cmd>Lspsaga term_toggle<CR>")

-- Float terminal
-- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", opts)
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
-- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
-- keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })

-- gitsigns
local gs = require 'gitsigns'
keymap('n', '<leader>blame', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', opts)
keymap('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', opts)
keymap('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', opts)
keymap('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>', opts)
keymap('n', '<leader>td', gs.toggle_deleted)



-- # luasnip
keymap("i", "<C-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<C-L>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<C-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<C-L>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

keymap("n", "<leader>tr", "<cmd>lua require'neotest'.run.run()<CR>", opts)
keymap("n", "<leader>tR", "<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<CR>", opts)
keymap("n", "<leader>to", "<cmd>lua require'neotest'.output.open()<CR>", opts)
keymap("n", "<leader>ts", "<cmd>lua require'neotest'.summary.toggle()<CR>", opts)

-- # dap
keymap('n', '<F1>', '<cmd>lua require("dapui").eval()<CR>', opts)
keymap('n', '<F2>', '<cmd>DapToggleBreakpoint<CR>', opts)
keymap('n', '<F3>', '<cmd>lua require("dap").run_last()<CR>', opts)
keymap('n', '<F4>', '<cmd>lua require("dapui").toggle()<CR>', opts)
keymap('n', '<F5>', '<cmd>DapContinue<CR>', opts)

keymap('n', '<F10>', '<cmd>DapStepOver<CR>', opts)
keymap('n', '<F11>', '<cmd>DapStepInto<CR>', opts)
keymap('n', '<F12>', '<cmd>DapStepOut<CR>', opts)
keymap('n', '<leader>dr', '<cmd>lua require("dap").repl.toggle()<CR>', opts)

keymap('n', '<leader>de', '<cmd>lua require("dap").set_exception_breakpoints({"uncaughted"})<CR>', opts)
keymap('n', '<leader>da', '<cmd>lua require("dap").set_exception_breakpoints({"all"})<CR>', opts)
keymap('n', '<leader>dc', '<cmd>lua require("dap").set_exception_breakpoints({})<CR>', opts)
