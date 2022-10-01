return function()
  require("flutter-tools").setup {
    debugger = {
      enabled = false,
      -- exception_breakpoints = { "uncaught" },
      register_configurations = function(_)
        -- require("dap").configurations.dart = {}
        -- require("dap.ext.vscode").load_launchjs()
      end,
    }
  }
end
