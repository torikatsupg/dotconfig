local M = {}

M.cmp = function()
  local cmp = require 'cmp'
  local lspkind = require 'lspkind'

  lspkind.init({
    symbol_map = {
      Copilot = "",
    },
  })

  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

  local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
  end



  cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = true -- TODO(torikatsu): check
    },
    mapping = {
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.complete(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.complete(),
      ["<Tab>"] = vim.schedule_wrap(function(fallback)
        if cmp.visible() and has_words_before() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end),
      ['<CR>'] = cmp.mapping.confirm({
        select = true,
        behavior = cmp.ConfirmBehavior.Insert,
      }),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-y>'] = cmp.mapping.complete({
        select = true,
      }),
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol',
        maxwidth = 50,
        ellipsis_char = '...',
        -- before = function (entry, vim_item)
        --   return vim_item
        -- end
      })
    }
  })
end

M.buffer = function()
  local cmp = require 'cmp'
  local config = cmp.get_config()
  table.insert(config.sources, {
    name = 'buffer',
    option = { keyword_length = 10 },
  })
  cmp.setup(config)

  local opts = require 'cmp.config'.cmdline['/'] or {}
  local extended_opts = vim.tbl_extend('force', opts, {
    sources = {
      { name = 'buffer' }
    },
  })

  require 'cmp'.setup.cmdline('/', extended_opts)
  local opts = require 'cmp.config'.cmdline['?'] or {}
  local extended_opts = vim.tbl_extend('force', opts, {
    sources = {
      { name = 'buffer' }
    },
  })
  require 'cmp'.setup.cmdline('?', extended_opts)
end

M.dictionary = function()
  local cmp = require 'cmp'
  local config = cmp.get_config()
  table.insert(config.sources, {
    name = "dictionary",
    keyword_length = 4,
  })
  cmp.setup(config)

  local dict = require("cmp_dictionary")

  dict.setup({
    exact = 2,
    first_case_insensitive = false,
    document = true,
    document_command = "wn %s -over",
    async = true,
    max_items = 10,
    capacity = 5,
    debug = true,
  })
end

M.path = function()
  local cmp = require 'cmp'
  local config = cmp.get_config()
  table.insert(config.sources, {
    name = 'path',
  })
  cmp.setup(config)


  local opts = require 'cmp.config'.cmdline[':'] or {}
  local extended_opts = vim.tbl_extend('force', opts, {
    sources = {
      { name = 'path' }
    },
  })
  require 'cmp'.setup.cmdline(':', extended_opts)
end

M.emoji = function()
  local cmp = require 'cmp'
  local config = cmp.get_config()
  table.insert(config.sources, {
    name = 'emoji',
  })
  cmp.setup(config)
end

M.luasnip = function()
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'
  local config = cmp.get_config()

  table.insert(config, {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    }
  })
  table.insert(config.sources, {
    name = 'luasnip'
  })
  cmp.setup(config)
end

M.lsp = function()
  local cmp = require 'cmp'
  local nvim_lsp = require 'cmp_nvim_lsp'
  local lspconfig = require 'lspconfig'
  local luasnip = require 'luasnip'

  local config = cmp.get_config()
  config.snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  }

  lspconfig.util.default_config = vim.tbl_extend(
    "force",
    lspconfig.util.default_config,
    { capabilities = nvim_lsp.default_capabilities }
  )

  table.insert(config.sources, { name = 'nvim_lsp' })
  cmp.setup(config)
end

M.lsp_signature_help = function()
  local cmp = require 'cmp'
  local config = cmp.get_config()
  table.insert(config.sources, {
    name = 'nvim_lsp_signature_help',
  })
  cmp.setup(config)
end

M.cmdline = function()
  local opts = require 'cmp.config'.cmdline[':'] or {}
  local extended_opts = vim.tbl_extend('force', opts, {
    sources = {
      { name = 'cmdline' }
    },
  })
  require 'cmp'.setup.cmdline(':', extended_opts)
end

M.copilot = function()
  require("copilot").setup({
    suggestion = { enabled = false, },
    panel = { enabled = false },
    filetypes = {
      ['*'] = true
    }
  })
  require("copilot_cmp").setup({
    formatters = {
      insert_text = require("copilot_cmp.format").remove_existing
    },
  })

  local cmp = require 'cmp'
  local config = cmp.get_config()
  table.insert(config.sources, { name = "copilot", })
  cmp.setup(config)
end

return M
