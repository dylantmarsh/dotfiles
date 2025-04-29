---@type LazySpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      preset = {
        header = table.concat({
          " ███▄    █  ▒█████   ██▓ ▄████▄  ▓█████ ",
          " ██ ▀█   █ ▒██▒  ██▒▓██▒▒██▀ ▀█  ▓█   ▀ ",
          "▓██  ▀█ ██▒▒██░  ██▒▒██▒▒▓█    ▄ ▒███   ",
          "▓██▒  ▐▌██▒▒██   ██░░██░▒▓▓▄ ▄██▒▒▓█  ▄ ",
          "▒██░   ▓██░░ ████▓▒░░██░▒ ▓███▀ ░░▒████▒",
          "░ ▒░   ▒ ▒ ░ ▒░▒░▒░ ░▓  ░ ░▒ ▒  ░░░ ▒░ ░",
          "░ ░░   ░ ▒░  ░ ▒ ▒░  ▒ ░  ░  ▒    ░ ░  ░",
          "   ░   ░ ░ ░ ░ ░ ▒   ▒ ░░           ░   ",
          "         ░     ░ ░   ░  ░ ░         ░  ░",
          "                     ░                  ",
        }, "\n"),
      },
    },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true }
  },
}
