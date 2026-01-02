-- Optional: Place this in lua/configs/conform.lua for more detailed formatting config
local options = {
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    lua = { "stylua" },
  },

  -- Format on save
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },

  -- Prettier options
  formatters = {
    prettier = {
      prepend_args = {
        "--single-quote",
        "--jsx-single-quote",
        "--trailing-comma", "es5",
        "--tab-width", "2",
        "--semi", "true",
      },
    },
  },
}

require("conform").setup(options)
