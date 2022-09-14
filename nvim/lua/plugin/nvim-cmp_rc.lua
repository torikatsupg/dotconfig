return function()
  local cmp = require 'cmp'
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')

  local cmp_kinds = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = '  ',
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
  }

  local cmp_type = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    luasnip = "[Snip]",
    nvim_lua = "[Lua]",
    latex_symbols = "[LaTeX]",
  }

  cmp.setup {
    sources = {
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_document_symbol' },
      { name = 'nvim_lsp_signature_help' },
      -- { name = 'cmdline' },
      { name = 'omni' },
      { name = 'buffer' },
      { name = 'path' },
      { name = "dictionary" },
      { name = 'spell' },
      { name = 'calc' },
      { name = 'emoji' },
      -- { name = 'digraphs' },
      { name = 'luasnip' },
      { name = 'treesitter' },
    },
    view = {
      entries = "custom"
    },
    formatting = {
      fields = {
        cmp.ItemField.Abbr,
        cmp.ItemField.Kind,
        cmp.ItemField.Menu,
      },
      format = function(entry, vim_item)
        vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
        vim_item.menu = cmp_type[entry.source.name]
        return vim_item
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
      expand = function(args)
        require 'luasnip'.lsp_expand(args.body)
      end
    },
    completion = {
      keyword_length = 2
    }
  }

  for _, cmd_type in ipairs({ ':', '@' }) do
    cmp.setup.cmdline(cmd_type, {
      sources = {
        { name = 'cmdline_history' },
      },
    })
  end

  for _, cmd_type in ipairs({ '/', '?' }) do
    cmp.setup.cmdline(cmd_type, {
      sources = {
        { name = 'buffer' },
        { name = 'cmdline_history'
        },
      },
    })
  end

  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )
end
