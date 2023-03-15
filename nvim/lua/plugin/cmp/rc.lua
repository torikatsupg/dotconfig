local M = {}

M.config_cmp = function()
  local cmp = require 'cmp'
  cmp.setup {
    sources = {},
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    -- snippet = {
    --   expand = function(args)
    --     require 'luasnip'.lsp_expand(args.body)
    --   end
    -- },
    -- completion = {
    --   keyword_length = 3,
    --   autocomplete = false
    -- },
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

        vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
        vim_item.menu = cmp_type[entry.source.name]
        return vim_item
      end,
    },
  }
end

M.config_buffer = function()
  local cmp = require 'cmp'
  local config = cmp.get_config()
  table.insert(config.sources, {
    name = 'buffer',
    option = { keyword_length = 10 },
  })
  cmp.setup(config)
end

M.config_cmp_dictionary = function()
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

M.config_cmp_nvim_lsp = function()
  local cmp = require 'cmp'
  local config = cmp.get_config()
  table.insert(config.sources, {
       name = 'nvim_lsp',
  })
  cmp.setup(config)
end

M.config_cmp_path = function()
  local cmp = require 'cmp'
  local config = cmp.get_config()
  table.insert(config.sources, {
    name = 'path',
  })
  cmp.setup(config)
end

M.config_cmp_emoji = function()
  local cmp = require 'cmp'
  local config = cmp.get_config()
  table.insert(config.sources, {
    name = 'emoji',
  })
  cmp.setup(config)
end

M.config_cmp_luasnip = function()
end

return M
