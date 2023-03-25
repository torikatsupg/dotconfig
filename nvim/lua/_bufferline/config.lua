local M = {}

M.bufferline = function()
  require 'bufferline'.setup {
    highlights = {
      buffer_selected = { italic = false, bold = false, },
      diagnostic_selected = { italic = false, bold = false, },
      hint_selected = { italic = false, bold = false, },
      pick_selected = { italic = false, bold = false, },
      pick_visible = { italic = false, bold = false, },
      pick = { italic = false, bold = false, },
      fill = {
        bg = '#000000',
      },
      separator = {
        fg = '#000000',
      },
      separator_selected = {
        fg = '#000000',
      },
      separator_visible = {
        fg = '#000000',
      },
    },
    options = {
      max_name_length = 20,
      indicator = {
        style = 'icon',
      },
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      separator_style = "slant",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' }
      },
      custom_areas = {
        right = function()
          local result = {}
          local seve = vim.diagnostic.severity
          local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
          local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
          local info = #vim.diagnostic.get(0, { severity = seve.INFO })
          local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

          if error ~= 0 then
            table.insert(result, { text = "  " .. error, fg = "#EC5241" })
          end

          if warning ~= 0 then
            table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
          end

          if hint ~= 0 then
            table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
          end

          if info ~= 0 then
            table.insert(result, { text = " ℹ️ " .. info, fg = "#7EA9A7" })
          end
          return result
        end,
      }
    }
  }
end

return M
