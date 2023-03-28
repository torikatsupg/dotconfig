local M = {}
M.noice = function()
  local function myMiniView(pattern, kind)
    kind = kind or ""
    return {
      view = "mini",
      filter = {
        event = "msg_show",
        kind = kind,
        find = pattern,
      },
    }
  end

  require("noice").setup({
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
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
    routes = {
      myMiniView("Already at .* change"),
      myMiniView("written"),
      myMiniView("yanked"),
      myMiniView("more lines?"),
      myMiniView("fewer lines?"),
      myMiniView("fewer lines?", "lua_error"),
      myMiniView("change; before"),
      myMiniView("change; after"),
      myMiniView("line less"),
      myMiniView("lines indented"),
      myMiniView("No lines in buffer"),
      myMiniView("search hit .*, continuing at", "wmsg"),
      myMiniView("E486: Pattern not found", "emsg"),
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

  require 'notify'.setup({
    background_colour = "#000000",
  })
end
return M
