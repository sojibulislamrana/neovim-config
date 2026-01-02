-- Load the defaults for on_attach, on_init, and capabilities
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- TypeScript/JavaScript with ts_ls (formerly tsserver)
vim.lsp.config.ts_ls = {
  default_config = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
  },
  docs = {
    description = "TypeScript/JavaScript language server",
  },
}

vim.lsp.enable "ts_ls"

-- HTML Language Server
vim.lsp.config.html = {
  default_config = {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "htmldjango" },
    root_markers = { "package.json" },
  },
  docs = {
    description = "HTML language server",
  },
}

vim.lsp.enable "html"

-- CSS Language Server
vim.lsp.config.cssls = {
  default_config = {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_markers = { "package.json" },
  },
  docs = {
    description = "CSS language server",
  },
}

vim.lsp.enable "cssls"

-- ESLint Language Server
vim.lsp.config.eslint = {
  default_config = {
    cmd = { "vscode-eslint-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    root_markers = {
      ".eslintrc",
      ".eslintrc.js",
      ".eslintrc.json",
      "package.json",
    },
  },
  docs = {
    description = "ESLint language server",
  },
}

vim.lsp.enable "eslint"

-- Tailwind CSS Language Server
vim.lsp.config.tailwindcss = {
  default_config = {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = {
      "html",
      "css",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    root_markers = {
      "tailwind.config.js",
      "tailwind.config.ts",
      "tailwind.config.cjs",
    },
  },
  docs = {
    description = "Tailwind CSS language server",
  },
}

vim.lsp.enable "tailwindcss"

-- JSON Language Server
vim.lsp.config.jsonls = {
  default_config = {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
  },
  docs = {
    description = "JSON language server",
  },
}

vim.lsp.enable "jsonls"
