---@type LazySpec
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  dependencies = {
    "giuxtaposition/blink-cmp-copilot",
    "saghen/blink.cmp",
  },
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false }
  },
  config = function(_, opts)
    require("copilot").setup(opts)
  end,
}
