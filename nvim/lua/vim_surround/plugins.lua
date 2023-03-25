local M = {}

M.vim_surround = {
    'tpope/vim-surround',
    opt = true,
    keys = {
      '<Plug>Dsurround',
      '<Plug>CSurround',
      '<Plug>YSurround',
      '<Plug>Yssurround',
      '<Plug>VSurround',
      '<Plug>VgSurround',
    },
    setup = function()
      vim.g.surround_no_mappings = true

      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }
      keymap('n', 'ds', '<Plug>Dsurround', opts)
      keymap('n', 'cs', '<Plug>Csurround', opts)
      keymap('n', 'cS', '<Plug>CSurround', opts)
      keymap('n', 'ys', '<Plug>Ysurround', opts)
      keymap('n', 'yS', '<Plug>YSurround', opts)
      keymap('n', 'yss', '<Plug>Yssurround', opts)
      keymap('n', 'ySs', '<Plug>YSsurround', opts)
      keymap('n', 'ySS', '<Plug>YSsurround', opts)
      keymap('x', 'S', '<Plug>VSurround', opts)
      keymap('x', 'gS', '<Plug>VgSurround', opts)

      keymap('i', '<C-S>', '<Plug>Isurround', opts)
      keymap('i', '<C-G>s', '<Plug>Isurround', opts)
      keymap('i', '<C-G>S', '<Plug>ISurround', opts)
    end,
    requires = {
      'tpope/vim-repeat',
      config = function()
        vim.fn['repeat#set'](vim.api.nvim_replace_termcodes('<Plug>MyWonderfulMap', true, false, true), vim.v.count)
      end,
      opt = true,
    },
    wants = {
      'vim-repeat'
    }
  }

return M