local M = {}

M.treesitter = function()
  require('nvim-treesitter.configs').setup({})
end

M.luasnip = function()
  local ls = require("luasnip")
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


  local none_ls = require('null-ls')
  local prettier = none_ls.builtins.formatting.prettier
  local sources = {

    none_ls.builtins.formatting.stylua,
    none_ls.builtins.completion.spell,
  }

  -- node_modulesに.prettierrcが存在するかを確認する関数
  local function has_prettierrc()
    local uv = vim.loop
    local cwd = uv.cwd()
    local prettierrc_path = cwd .. ".prettierrc"
    local stat = uv.fs_stat(prettierrc_path)
    return stat and stat.type == "file"
  end

  -- prettierrcが存在する場合のみprettierを有効にする
  if has_prettierrc() then
    table.insert(sources, prettier)
  end


  local async_formatting = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    vim.lsp.buf_request(
      bufnr,
      "textDocument/formatting",
      vim.lsp.util.make_formatting_params({}),
      function(err, res, ctx)
        if err then
          local err_msg = type(err) == "string" and err or err.message
          -- you can modify the log message / level (or ignore it completely)
          vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
          return
        end

        -- don't apply results if buffer is unloaded or has been modified
        if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
          return
        end

        if res then
          local client = vim.lsp.get_client_by_id(ctx.client_id)
          vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
          vim.api.nvim_buf_call(bufnr, function()
            vim.cmd("silent noautocmd update")
          end)
        end
      end
    )
  end

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  none_ls.setup({
    sources = sources,
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePost", {
          group = augroup,
          buffer = bufnr,
          callback = function() async_formatting(bufnr) end,
        })
      end
    end,
  })

  mason_lspconfig.setup_handlers({
    function(server)
      local opts = {
        handlers = {
          ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
            { virtual_text = false })
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

  -- NOTE: Manualy format keymap
  local keymap = vim.keymap.set
  local o = { noremap = true, silent = false }
  keymap('n', '<space>f', function()
    vim.lsp.buf.format()
  end, o)
end

return M
