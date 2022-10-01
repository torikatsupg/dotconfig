return function()
  require("nvim-dap-virtual-text").setup {
    enabled = true,
    enabled_commands = true,
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = true,
    show_stop_reason = true,
    commented = false,
    only_first_definition = true,
    all_references = true, -- show virtual text on all all references of the variable (not only definitions)
    -- filter_references_pattern = '<module',
    -- experimental features:
    -- virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
    -- all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    -- virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
    -- virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
  }
end
