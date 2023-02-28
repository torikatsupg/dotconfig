vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=#5F5F87 guibg=none ]]

-- ╭─╮
-- │ │
-- ╰─╯
local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts)
end

function setup_prettier()
  local status, prettier = pcall(require, "prettier")
  if (not status) then return end
  prettier.setup {
    bin = 'prettierd',
    filetypes = {
      "css",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "json",
      "scss",
      "less"
    }
  }
end

return function()
  local config = require 'lspconfig'
  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
  })

  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end


  local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    require("nvim-navic").attach(client, bufnr)
  end

  local lsp_flags = {
    debounce_text_changes = 50,
  }

  local capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )

  config.eslint.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
  }
  -- config.prettier.setup {
  --   on_attach = on_attach,
  --   flags = lsp_flags,
  --   capabilities = capabilities,
  -- }
  config.tsserver.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
  }
  config.dartls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
  }
  config.yamlls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
  }
  config.lua_ls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT', },
        diagnostics = { globals = { 'vim', 'hs' }, },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = { enable = false, },
      },
    },
  }

  setup_prettier()
end

