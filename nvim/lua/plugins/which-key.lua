return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.add({
      {
        "<leader>D",
        group = "Duck",
        icon = "🦆"
      },
      {
        "<leader>Dd",
        function() require('duck').hatch() end,
        desc = "Duck Hatch",
        icon = "🥚"
      },
      {
        "<leader>Dk",
        function() require('duck').cook_all() end,
        desc = "Duck Kill All",
        icon = "🍗"
      },
      {
        "<leader>fp",
        "<cmd>ProjectExplorer<CR>",
        desc = "Project Explorer",
        icon = "📁"
      }
    })
  end,
}

