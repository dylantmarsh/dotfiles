---@type LazySpec
return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local dap  = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      controls = {
        enabled = true,
        element = "repl",
        icons = {
          disconnect = "", pause      = "", play      = "",
          run_last   = "", step_back  = "", step_into  = "",
          step_out   = "", step_over  = "", terminate  = "",
        },
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = "single",
        mappings = { close = { "q", "<Esc>" } }
      },
      force_buffers = true,
      icons = {
        collapsed     = "",
        expanded      = "",
        current_frame = "",
      },
      layouts = {
        {
          elements = {
            { id = "scopes",      size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks",      size = 0.25 },
            { id = "watches",     size = 0.25 },
          },
          position = "left",
          size     = 40,
        },
        {
          elements = {
            { id = "repl", size = 1.0 },  -- only the REPL, no "console"
          },
          position = "bottom",
          size     = 10,
        },
      },
      mappings = {
        edit   = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open   = "o",
        remove = "d",
        repl   = "r",
        toggle = "t",
      },
      render = {
        indent          = 1,
        max_value_lines = 100,
      },
    })

    -- Auto-open / close hooks:
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}

