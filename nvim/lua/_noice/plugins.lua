local M = {}
M.noice =  {
  "folke/noice.nvim",
  tag = 'v1.10.1',
  opt = true,
  config = function () require '_noice.config'.noice() end,
  event = { 'VimEnter' },
  requires = {
    {
      "MunifTanjim/nui.nvim",
      commit = '0dc148c6ec06577fcf06cbab3b7dac96d48ba6be',
       opt = true
    },
    {
    "rcarriga/nvim-notify",
    commit ='02047199e2752223c77c624160f720ca227944a9',
    opt = true
    }
  },
  wants = {
    'nui.nvim',
    'nvim-notify',
  },
}
return M