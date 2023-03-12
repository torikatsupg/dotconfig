local M = {}

M.plenary = {
  'nvim-lua/plenary.nvim',
  tag = 'v0.1.3',
  opt = true,
  module_pattern = { 'plenary.*' },
}

M.nvim_web_devicions = {
  'nvim-tree/nvim-web-devicons',
  commit = '4af94fec29f508159ceab5413383e5dedd6c24e3',
  opt = true,
  module = { 'nvim-web-devicons' },
}

M.treesitter = {
  'nvim-treesitter/nvim-treesitter',
  tag = 'v0.8.5.2',
  opt = true,
  module_pattern = { 'nvim-treesitter.*' },
  run = ':TSUpdate',
  config = function() 
    require('nvim-treesitter.configs').setup({
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      },
    })
    vim.notify('setup treesitter')
  end
}

return M
