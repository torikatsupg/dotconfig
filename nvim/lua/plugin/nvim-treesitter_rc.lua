return function()
  require("nvim-treesitter.configs").setup {
    yati = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 500,
    },
    context_commentstring = {
      enable = true
    },
    matchup = {
      enable = true,
    },
  }
end
