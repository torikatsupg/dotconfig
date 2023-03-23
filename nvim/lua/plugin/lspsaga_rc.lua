return function()
  require("lspsaga").setup({
    symbols_in_winbar = {
      enable = false
    },
    ui = {
      code_action = '',
      border = 'rounded',
      winblend = 0,
    },
  })
end
