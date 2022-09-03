vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

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
  luasnip = "[LuaSnip]",
  nvim_lua = "[Lua]",
  latex_symbols = "[LaTeX]",
}

cmp.setup {
  -- preselect = cmp.PreselectMode.None,
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_document_symbol' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'cmdline' },
    { name = 'omni' },
    { name = 'buffer' },
    { name = 'path' },
    { name = "dictionary" },
    { name = 'spell' },
    { name = 'calc' },
    { name = 'emoji' },
    { name = 'digraphs' },
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
      require'luasnip'.lsp_expand(args.body)
    end
  },
}

for _, cmd_type in ipairs({':', '@'}) do
  cmp.setup.cmdline(cmd_type, {
    sources = {
      { name = 'cmdline_history' },
    },
  })
end

for _, cmd_type in ipairs({'/', '?'}) do
  cmp.setup.cmdline(cmd_type, {
    sources = {
      { name = 'buffer' },
      { name = 'cmdline_history'
    },
  },
})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
