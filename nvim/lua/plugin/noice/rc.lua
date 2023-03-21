  local M = {}
  M.config_noice =  function()
      require("noice").setup({
        lsp = {
          override = {
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,           -- use a classic bottom cmdline for search
          command_palette = true,         -- position the cmdline and popupmenu together
          long_message_to_split = true,   -- long messages will be sent to a split
          inc_rename = false,             -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,         -- add a border to hover docs and signature help
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


    end
  return M
