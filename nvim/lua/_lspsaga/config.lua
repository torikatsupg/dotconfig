local M = {}
M.lspsaga = function()
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
  local o = { noremap = true, silent = false }
  local n = 'n'
  keymap(n, "gh", "<cmd>Lspsaga lsp_finder<CR>", o)
  keymap("v", "ga", "<cmd>Lspsaga range_code_action<CR>", o)
  keymap(n, "gr", "<cmd>Lspsaga rename<CR>", o)
  keymap(n, "gr", "<cmd>Lspsaga rename ++project<CR>", o)
  keymap(n, "gd", "<cmd>Lspsaga peek_definition<CR>", o)
  keymap(n, "gd", "<cmd>Lspsaga goto_definition<CR>", o)
  keymap(n, "gt", "<cmd>Lspsaga peek_type_definition<CR>", o)
  keymap(n, "gt", "<cmd>Lspsaga goto_type_definition<CR>", o)

  keymap(n, "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", o)
  keymap(n, "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", o)
  keymap(n, "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", o)

  keymap(n, "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", o)
  keymap(n, "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", o)
  keymap(n, "[E", function() require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, o)
  keymap(n, "]E", function() require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR }) end, o)
  keymap(n, "K", "<cmd>Lspsaga hover_doc<CR>", o)
  keymap(n, "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", o)
  keymap(n, "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", o)
  keymap({ n, "t" }, "∂", "<cmd>Lspsaga term_toggle<CR>", o)
  keymap(n, '<space>f', vim.lsp.buf.format, o)
end

return M
