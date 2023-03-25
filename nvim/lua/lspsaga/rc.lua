local M = {}
M.config = function()
  require("lspsaga").setup({
    ui = {
      border = 'rounded',
      winblend = 0,
    },
    lightbulb = {
      enable = false,
    },
    symbol_in_winbar = {
      enable = false,
    },
  })

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = false }
  keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
  keymap("v", "ga", "<cmd>Lspsaga range_code_action<CR>", opts)
  keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
  keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
  keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
  keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
  keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
  keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

  keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
  keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
  keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

  keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap("n", "[E", function() require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
    opts)
  keymap("n", "]E", function() require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR }) end,
    opts)
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
  keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
  keymap({ "n", "t" }, "∂", "<cmd>Lspsaga term_toggle<CR>")
  keymap('n', '<space>f', vim.lsp.buf.format, opts)
end

return M
