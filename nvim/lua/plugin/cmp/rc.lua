local M = {}

M.config_cmp = function()
  local cmp = require'cmp'
  local config = cmp.get_config()
  config.window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
  config.mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }) 
  cmp.setup(config)
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
  local cmp = require 'cmp'
  local luasnip = require'luasnip'
  local config = cmp.get_config()

  table.insert(config, {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) 
      end
    }
  })
  table.insert(config.sources,  {
    name = 'luasnip'
  })
  cmp.setup(config)
end

M.config_cmp_nvim_lsp = function()
  local cmp = require 'cmp'
  local nvim_lsp = require 'cmp_nvim_lsp'
  local lspconfig = require 'lspconfig'
  local mason_lspconfig = require 'mason-lspconfig'
  local luasnip = require 'luasnip'

  local config = cmp.get_config()
  config.snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  }

  mason_lspconfig.setup_handlers({
    function (server)
      local capabilities = nvim_lsp.default_capabilities()
      lspconfig[server].setup({
        capabilities = capabilities,
    })
    end
  })
  table.insert(config.sources,  { name = 'nvim_lsp' })
  cmp.setup(config)
end

M.config_nvim_lsp_signature_help = function()
  local cmp = require 'cmp'
  local config = cmp.get_config()
  table.insert(config.sources, {
    name = 'nvim_lsp_signature_help',
  })
  cmp.setup(config)
  vim.notify('nvim lsp')
end

return M
