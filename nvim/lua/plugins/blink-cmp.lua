---@type LazySpec
return {
  "saghen/blink.cmp",
  optional = true,
  dependencies = {
    "giuxtaposition/blink-cmp-copilot",
  },
  opts = {
    appearance = {
      nerd_font_variant = "mono",
      kind_icons = {
				Text = "",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "",
				Field = "󰇽",
				Variable = "󰂡",
				Class = "󰜁",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "󰒕",
				Color = "󰏘",
				Reference = "",
				File = "",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰅲",
			},
    },
    keymap = { preset = "default" },
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
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      ghost_text = {
        enabled               = true,
        show_with_selection   = true,
        show_without_selection= true,
        show_with_menu        = true,
        show_without_menu     = true,
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },
  },
}
