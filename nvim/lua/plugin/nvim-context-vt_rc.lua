return function()
  require('nvim_context_vt').setup({
    enabled = false,
    -- disable_ft = { 'markdown', 'yaml', 'yml', 'dart', 'rs', 'ts', 'tsx', 'js' },
  })
end
