return {
  "rcarriga/nvim-dap-ui",
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup({
      layouts = {
        {
          elements = {
            "scopes",
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            "repl",
          },
          size = 10,
          position = "bottom",
        },
      },
    })
    
    -- Function to scroll REPL to bottom
    local function scroll_repl_to_bottom()
      local wins = vim.fn.getwininfo()
      for _, win in pairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win.winid)
        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
        if ft == "dap-repl" then
          local last_line = vim.api.nvim_buf_line_count(buf)
          vim.api.nvim_win_set_cursor(win.winid, {last_line, 0})
        end
      end
    end

    -- Define the desired width for DAP-UI windows
    local DAPUI_WIDTH = 40
    local stored_neotree_width = nil

    -- Function to maintain DAP-UI width
    local function maintain_dapui_width()
      local dapui_fts = {
        "dapui_scopes",
        "dapui_breakpoints",
        "dapui_stacks",
        "dapui_watches"
      }
      
      for _, win in pairs(vim.fn.getwininfo()) do
        local buf = vim.api.nvim_win_get_buf(win.winid)
        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
        if vim.tbl_contains(dapui_fts, ft) and vim.api.nvim_win_get_width(win.winid) ~= DAPUI_WIDTH then
          vim.api.nvim_win_set_width(win.winid, DAPUI_WIDTH)
        end
      end
    end

    -- Watch for ANY window layout changes
    vim.api.nvim_create_autocmd({ "WinNew", "WinClosed", "WinScrolled", "VimResized" }, {
      callback = function()
        vim.defer_fn(maintain_dapui_width, 10)
      end
    })

    -- Auto scroll REPL when window scrolls
    vim.api.nvim_create_autocmd("WinScrolled", {
      pattern = "*",
      callback = scroll_repl_to_bottom
    })

    -- Store neo-tree width when it opens
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "neo-tree",
      callback = function()
        vim.defer_fn(function()
          for _, win in pairs(vim.fn.getwininfo()) do
            local buf = vim.api.nvim_win_get_buf(win.winid)
            local ft = vim.api.nvim_buf_get_option(buf, "filetype")
            if ft == "neo-tree" then
              stored_neotree_width = vim.api.nvim_win_get_width(win.winid)
              break
            end
          end
        end, 50)
      end
    })

    -- Automatically open UI and scroll REPL
    dap.listeners.after.event_initialized["dapui_config"] = function()
      -- Store neo-tree width if it exists
      for _, win in pairs(vim.fn.getwininfo()) do
        local buf = vim.api.nvim_win_get_buf(win.winid)
        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
        if ft == "neo-tree" then
          stored_neotree_width = vim.api.nvim_win_get_width(win.winid)
          break
        end
      end
      
      dapui.open()
      vim.defer_fn(function()
        scroll_repl_to_bottom()
        maintain_dapui_width()
      end, 100)
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
      -- Restore neo-tree width if it exists
      if stored_neotree_width then
        vim.defer_fn(function()
          for _, win in pairs(vim.fn.getwininfo()) do
            local buf = vim.api.nvim_win_get_buf(win.winid)
            local ft = vim.api.nvim_buf_get_option(buf, "filetype")
            if ft == "neo-tree" then
              vim.api.nvim_win_set_width(win.winid, stored_neotree_width)
              break
            end
          end
        end, 50)
      end
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
      -- Restore neo-tree width if it exists
      if stored_neotree_width then
        vim.defer_fn(function()
          for _, win in pairs(vim.fn.getwininfo()) do
            local buf = vim.api.nvim_win_get_buf(win.winid)
            local ft = vim.api.nvim_buf_get_option(buf, "filetype")
            if ft == "neo-tree" then
              vim.api.nvim_win_set_width(win.winid, stored_neotree_width)
              break
            end
          end
        end, 50)
      end
    end

    -- Additional listener for REPL output
    dap.listeners.after.event_output["dapui_config"] = function()
      vim.defer_fn(function()
        scroll_repl_to_bottom()
      end, 50)
    end
  end,
}
