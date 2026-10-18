--------------------------------------------------------------------------------
-- UIプラグイン
-- UI/UX向上のためのプラグイン群
--------------------------------------------------------------------------------

return {
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
  -- fidget.nvim: 軽量LSP進捗表示
  -- 画面右下に小さくLSP進捗を表示
  ------------------------------------------------------------------------------
  {
    'j-hui/fidget.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  ------------------------------------------------------------------------------
  -- trouble.nvim: 診断・quickfix一覧表示
  -- LSP診断やquickfixをきれいな一覧で表示
  ------------------------------------------------------------------------------
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xq', '<cmd>Trouble qflist toggle<CR>', desc = 'Quickfix (Trouble)' },
      {
        '<leader>xp',
        function()
          vim.notify('Running tsc --noEmit ...', vim.log.levels.INFO)
          local output = vim.fn.system('npx tsc --noEmit 2>&1')
          local lines = vim.split(output, '\n')
          local items = {}
          for _, line in ipairs(lines) do
            local file, lnum, col, msg = line:match('^(.-)%((%d+),(%d+)%):%s*(.+)$')
            if file then
              table.insert(items, {
                filename = file,
                lnum = tonumber(lnum),
                col = tonumber(col),
                text = msg,
              })
            end
          end
          vim.fn.setqflist(items, 'r')
          if #items == 0 then
            vim.notify('No errors found', vim.log.levels.INFO)
          else
            vim.notify(#items .. ' errors found', vim.log.levels.WARN)
            vim.cmd('Trouble qflist open focus=true')
          end
        end,
        desc = 'Project diagnostics (tsc)',
      },
    },
    opts = {},
  },

  ------------------------------------------------------------------------------
  -- diffview.nvim: Git diff表示
  -- ファイルツリー形式でGit diffを確認（Claude Code変更確認に便利）
  ------------------------------------------------------------------------------
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = 'Diffview open' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<CR>', desc = 'File history' },
      { '<leader>gq', '<cmd>DiffviewClose<CR>', desc = 'Diffview close' },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },

  ------------------------------------------------------------------------------
  -- toggleterm.nvim: ターミナル管理
  -- 複数ターミナルの管理・切り替え
  ------------------------------------------------------------------------------
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
      { '<C-\\>', '<cmd>ToggleTerm<CR>', desc = 'Toggle terminal' },
      { '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', desc = 'Float terminal' },
      { '<leader>th', '<cmd>ToggleTerm direction=horizontal size=15<CR>', desc = 'Horizontal terminal' },
      { '<leader>tv', '<cmd>ToggleTerm direction=vertical size=80<CR>', desc = 'Vertical terminal' },
    },
    opts = {
      open_mapping = [[<C-\>]],
      direction = 'float',
      float_opts = { border = 'rounded' },
    },
  },
}
