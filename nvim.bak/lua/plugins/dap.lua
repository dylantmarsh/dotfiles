return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require "dap"

    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = vim.fn.stdpath "data" .. "/mason/bin/OpenDebugAD7",
    }

    dap.configurations.go = {}

    vim.fn.sign_define("DapBreakpoint", {
      text = "●",  -- Large circle
      texthl = "DapBreakpoint",
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapBreakpointCondition", {
      text = "●",
      texthl = "DapBreakpointCondition",
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapBreakpointRejected", {
      text = "●",
      texthl = "DapBreakpointRejected",
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapLogPoint", {
      text = "●",
      texthl = "DapLogPoint",
      linehl = "",
      numhl = "",
    })

    -- Define custom highlight groups
    vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e3004b" })  -- Red
    vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#ff007c" })  -- Magenta
    vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#a9b1d6" })  -- Gray
    vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#4fd6be" })  -- Cyan
  end,
}
