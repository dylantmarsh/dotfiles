return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require "dap"

    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = vim.fn.stdpath "data" .. "/mason/bin/OpenDebugAD7",
    }

    require("dap.ext.vscode").load_launchjs()
  end,
}
