-- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=#5F5F87 guibg=none ]]

-- -- ╭─╮
-- -- │ │
-- -- ╰─╯
-- local border = {
--   { "╭", "FloatBorder" },
--   { "─", "FloatBorder" },
--   { "╮", "FloatBorder" },
--   { "│", "FloatBorder" },
--   { "╯", "FloatBorder" },
--   { "─", "FloatBorder" },
--   { "╰", "FloatBorder" },
--   { "│", "FloatBorder" },
-- }

-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts)
--   opts = opts or {}
--   opts.border = opts.border or border
--   return orig_util_open_floating_preview(contents, syntax, opts)
-- end

return function()
  -- vim.diagnostic.config({
  --   virtual_text = false,
  --   signs = true,
  --   underline = true,
  --   update_in_insert = false,
  --   severity_sort = false,
  -- })

  -- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  -- for type, icon in pairs(signs) do
  --   local hl = "DiagnosticSign" .. type
  --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  -- end

  -- local on_attach = function(client, bufnr)
  --   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  --   require("nvim-navic").attach(client, bufnr)
  -- end

  -- local lsp_flags = {
  --   debounce_text_changes = 50,
  -- }

--  local config = require 'lspconfig'
--  config.lua_ls.setup {
--    on_attach = on_attach,
--    flags = lsp_flags,
--   }
  -- require'lspconfig'.lua_ls.setup{}
  vim.lsp.set_log_level("debug")
end

