local M = {}

M.open_filesystem = function()
  local reveal_file = vim.fn.expand('%:p')
  if (reveal_file == '') then
    reveal_file = vim.fn.getcwd()
  else
    local f = io.open(reveal_file, "r")
    if (f) then
      f.close(f)
    else
      reveal_file = vim.fn.getcwd()
    end
  end
  require('neo-tree.command').execute({
    reveal_file = reveal_file,
    reveal_force_cwd = true,
  })
end

M.neotree = function()
  require 'neo-tree'.setup({
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    source_selector = {
      winbar = true,
    },
    mappings = {
      ['q'] = "revert_preview"
    },
    window = {
      position = 'float',
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      hijack_netrw_behavior = "disabled" -- lazy load requires
    },
    event_handlers = {
      {
        event = 'after_render',
        handler = function()
          local state = require('neo-tree.sources.manager').get_state('filesystem')
          if not require('neo-tree.sources.common.preview').is_active() then
             state.config = { use_float = true }
            state.commands.toggle_preview(state)
          end
        end
      },
    }
  })
end

return M
