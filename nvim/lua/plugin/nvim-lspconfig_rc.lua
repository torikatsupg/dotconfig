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
    debounce_text_changes = 150,
  }

  local capabilities = require('cmp_nvim_lsp').update_capabilities(
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
  config.sumneko_lua.setup {
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
