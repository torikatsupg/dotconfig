local M = {}
M.noice = function()
  require("noice").setup({
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = false,        -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false,       -- add a border to hover docs and signature help
    },
    -- routes = {
    --   {
    --     view = "notify",
    --     -- filter = { event = "msg_showmode" },
    --   },
    -- },
    views = {
      cmdline_popup = {
        position = {
          row = "50%",
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        backend = "cmp",
        position = {
          row = "50%",
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
  })


  local extensions = function(name, prop)
    return function()
      local telescope = require "telescope"
      telescope.load_extension(name)
      return telescope.extensions[name][prop]({})
    end
  end
  local opts = { noremap = true, silent = false }
  vim.keymap.set("n", "<Leader>fn", extensions("noice", "noice"), opts)

  require 'notify'.setup ({
background_colour = "#000000",
  })
end
return M
