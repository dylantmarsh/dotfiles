return {
  "leoluz/nvim-dap-go",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    local dap = require("dap")
    require("dap-go").setup()

    -- Clear any existing configurations and load only from launch.json
    vim.schedule(function()
      dap.configurations.go = {}
      require("dap.ext.vscode").load_launchjs(nil, { go = { "go" } })
    end)
  end,
}
