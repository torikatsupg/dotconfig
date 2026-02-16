--------------------------------------------------------------------------------
-- UIプラグイン
-- UI/UX向上のためのプラグイン群
--------------------------------------------------------------------------------

return {
  ------------------------------------------------------------------------------
  -- bufferline.nvim: バッファタブ表示
  -- 開いているバッファをタブのように表示
  ------------------------------------------------------------------------------
  {
    'akinsho/bufferline.nvim',
    version = '*',
    event = 'BufRead',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        max_name_length = 20,
        diagnostics = 'nvim_lsp',
        separator_style = 'slant',
        always_show_bufferline = true,
      },
    },
  },

  ------------------------------------------------------------------------------
  -- neo-tree.nvim: ファイルエクスプローラー
  -- サイドバー形式のファイルツリー表示（フロートウィンドウ）
  ------------------------------------------------------------------------------
  {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    init = function()
      -- カスタムコマンド:Eでファイルツリーを開く
      vim.api.nvim_create_user_command('E', function()
        local reveal_file = vim.fn.expand('%:p')
        if reveal_file == '' then
          reveal_file = vim.fn.getcwd()
        else
          local f = io.open(reveal_file, 'r')
          if f then
            f:close()
          else
            reveal_file = vim.fn.getcwd()
          end
        end
        require('neo-tree.command').execute({
          reveal_file = reveal_file,
          reveal_force_cwd = true,
        })
      end, {})
    end,
    config = function()
      require('neo-tree').setup({
        popup_border_style = 'rounded',
        enable_git_status = true,
        enable_diagnostics = true,
        source_selector = { winbar = true },
        mappings = { ['q'] = 'revert_preview' },
        window = { position = 'float' },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          hijack_netrw_behavior = 'disabled',
        },
        event_handlers = {
          {
            event = 'after_render',
            handler = function()
              local state = require('neo-tree.sources.manager').get_state('filesystem')
              if not require('neo-tree.sources.common.preview').is_active() then
                state.config = { use_float = true }
                state.commands.toggle_preview(state)
              end
            end,
          },
        },
      })
    end,
  },

  ------------------------------------------------------------------------------
  -- lspsaga.nvim: LSP UI強化
  -- LSP機能のUIを美しく改善（定義プレビュー、リネームなど）
  ------------------------------------------------------------------------------
  {
    'glepnir/lspsaga.nvim',
    event = 'BufRead',
    cmd = 'Lspsaga',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lspsaga').setup({
        ui = {
          border = 'rounded',
          winblend = 0,
        },
        lightbulb = { enable = false },
        symbol_in_winbar = { enable = false },
      })

      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = false }

      -- LSP操作
      keymap('n', 'gh', '<cmd>Lspsaga finder<CR>', opts)
      keymap({ 'n', 'v' }, 'ga', '<cmd>Lspsaga code_action<CR>', opts)
      keymap('n', 'gr', '<cmd>Lspsaga rename ++project<CR>', opts)
      keymap('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', opts)
      keymap('n', 'gt', '<cmd>Lspsaga goto_type_definition<CR>', opts)
      keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)

      -- 診断表示
      keymap('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
      keymap('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
      keymap('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>', opts)

      -- 診断ジャンプ
      keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
      keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
      keymap('n', '[E', function()
        require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end, opts)
      keymap('n', ']E', function()
        require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
      end, opts)

      -- コールヒエラルキー
      keymap('n', '<Leader>ci', '<cmd>Lspsaga incoming_calls<CR>', opts)
      keymap('n', '<Leader>co', '<cmd>Lspsaga outgoing_calls<CR>', opts)

      -- ターミナル
      keymap({ 'n', 't' }, '∂', '<cmd>Lspsaga term_toggle<CR>', opts)
    end,
  },

  ------------------------------------------------------------------------------
  -- noice.nvim: コマンドラインUI刷新
  -- コマンドライン、メッセージ、通知を美しいUIで表示
  ------------------------------------------------------------------------------
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      local function myMiniView(pattern, kind)
        kind = kind or ''
        return {
          view = 'mini',
          filter = {
            event = 'msg_show',
            kind = kind,
            find = pattern,
          },
        }
      end

      require('noice').setup({
        lsp = {
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },
        presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
        views = {
          cmdline_popup = {
            position = { row = '50%', col = '50%' },
            size = { width = 60, height = 'auto' },
          },
          popupmenu = {
            relative = 'editor',
            backend = 'cmp',
            position = { row = '50%', col = '50%' },
            size = { width = 60, height = 10 },
            border = { style = 'rounded', padding = { 0, 1 } },
            win_options = {
              winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
            },
          },
        },
        routes = {
          myMiniView('Already at .* change'),
          myMiniView('written'),
          myMiniView('yanked'),
          myMiniView('more lines?'),
          myMiniView('fewer lines?'),
          myMiniView('fewer lines?', 'lua_error'),
          myMiniView('change; before'),
          myMiniView('change; after'),
          myMiniView('line less'),
          myMiniView('lines indented'),
          myMiniView('No lines in buffer'),
          myMiniView('search hit .*, continuing at', 'wmsg'),
          myMiniView('E486: Pattern not found', 'emsg'),
        },
      })

      -- Noice履歴表示キーマップ
      vim.keymap.set('n', '<Leader>fn', function()
        local telescope = require('telescope')
        telescope.load_extension('noice')
        return telescope.extensions.noice.noice({})
      end, { noremap = true, silent = false, desc = 'Noice history' })

      -- nvim-notify設定
      require('notify').setup({
        background_colour = '#000000',
      })
    end,
  },
}
