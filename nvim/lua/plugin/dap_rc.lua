-- TODO(torikatsu): configure
return function()
  local dap = require('dap')

  dap.adapters.dart = {
    type = "executable",
    command = "flutter",
    args = { "debug_adapter" }
  }
  dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "chrome",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
      toolArgs = { "-d", "chrome" }
    },
    {
      type = "dart",
      request = "launch",
      name = "ios",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
      toolArgs = { "-d", "iphone" }
    }
  }
end
