---@type LazySpec
return {
  "Saghen/blink.cmp",
  optional = true,
  dependencies = {
    "giuxtaposition/blink-cmp-copilot",
  },
  opts = {
    -- your normal keymap preset (or configure manually)
    keymap = { preset = "default" },

    -- tell blink.cmp about your sources
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        copilot = {
          module       = "blink-cmp-copilot",
          name         = "copilot",
          async        = true,
          score_offset = 100,
          enabled      = true,
        },
      },
    },
    completion = {
      ghost_text = {
        enabled               = true,
        show_with_selection   = true,
        show_without_selection= true,
        show_with_menu        = true,
        show_without_menu     = true,
      },
    },
  },
}
