local M = {}

M.treesitter = function()
  require('nvim-treesitter.configs').setup({})
end

M.luasnip = function()
  local ls = require("luasnip")
  -- some shorthands...
  local snip = ls.snippet
  local node = ls.snippet_node
  local text = ls.text_node
  local insert = ls.insert_node
  local func = ls.function_node
  local choice = ls.choice_node
  local dynamicn = ls.dynamic_node

  local date = function() return { os.date('%Y-%m-%d') } end

  ls.add_snippets(nil, {
    all = {
      snip({
        trig = "datedatedate",
        namr = "Date",
        dscr = "Date in the form of YYYY-MM-DD",
      }, {
        func(date, {}),
      }),
    },
  })
end

M.lspconfig = function()
  local lspconfig = require 'lspconfig'
  require 'mason'.setup()
  local mason_lspconfig = require 'mason-lspconfig'
  mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "rust_analyzer" },
    automatic_installation = true,
  })
  mason_lspconfig.setup_handlers({
    function (server)
      local opts = {
        handlers = {
          ["textDocument/publishDiagnostics"] = vim.lsp.with( vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
        }
      }
      if server == 'lua_ls' then
        opts.settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        }
      end
      lspconfig[server].setup(opts)
      end
  })
end

return M
