return function()
  require('nightfox').setup({
    options = {
      transparent = true,
    }
  })
  vim.cmd("colorscheme duskfox")
end
