---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      -- install language servers
      "css-lsp",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "gopls",
      "json-lsp",
      "lua-language-server",
      "python-lsp-server",
      "tailwindcss-language-server",
      "typescript-language-server",
      "vue-language-server",
      "yaml-language-server",

      -- install formatters
      "stylua",

      -- install debuggers
      "delve",

      -- install other packages
      "tree-sitter-cli",
    },
  },
}
