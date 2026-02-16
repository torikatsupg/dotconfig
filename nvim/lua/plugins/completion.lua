--------------------------------------------------------------------------------
-- 補完プラグイン
-- コード補完に関するプラグイン群
--------------------------------------------------------------------------------

return {
  ------------------------------------------------------------------------------
  -- nvim-cmp: 補完エンジン
  -- 様々なソースからの補完候補を統合して表示
  ------------------------------------------------------------------------------
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      -- 補完候補のアイコン表示
      'onsails/lspkind.nvim',
      -- 各種補完ソース
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-cmdline',
      'dmitmel/cmp-cmdline-history',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')

      lspkind.init({ mode = 'symbol' })

      -- 入力があるかチェック（Neovim 0.11: vim.boを使用）
      local has_words_before = function()
        if vim.bo[0].buftype == 'prompt' then
          return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
          and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match('^%s*$') == nil
      end

      local mapping_modes = { 'i', 'c' }

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        experimental = {
          ghost_text = true,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), mapping_modes),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), mapping_modes),
          ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), mapping_modes),
          ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), mapping_modes),
          ['<Tab>'] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              else
                fallback()
              end
            end,
            c = cmp.mapping.select_next_item(),
          }),
          ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), mapping_modes),
          ['<CR>'] = cmp.mapping({
            i = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
            c = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
          }),
          ['<C-e>'] = cmp.mapping(cmp.mapping.abort(), mapping_modes),
          ['<C-y>'] = cmp.mapping({
            i = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
            c = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
          }),
        }),
        formatting = {
          format = lspkind.cmp_format({ mode = 'symbol' }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'nvim_lsp_signature_help' },
        }, {
          { name = 'buffer', option = { keyword_length = 10 } },
          { name = 'path' },
          { name = 'emoji' },
        }),
      })

      -- コマンドライン補完設定
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
          { name = 'cmdline_history' },
        }),
      })
    end,
  },

  ------------------------------------------------------------------------------
  -- cmp-dictionary: 辞書補完
  -- 英単語などの辞書からの補完を提供
  ------------------------------------------------------------------------------
  {
    'uga-rosa/cmp-dictionary',
    lazy = true,
    build = 'brew install wordnet',
    config = function()
      require('cmp_dictionary').setup({
        exact = 2,
        first_case_insensitive = false,
        document = true,
        document_command = 'wn %s -over',
        async = true,
        max_items = 10,
        capacity = 5,
        debug = false,
      })
    end,
  },
}
