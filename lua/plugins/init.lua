return {
  -- Mason for managing LSPs, DAPs, linters, etc.
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason-lspconfig for automatic LSP server installation
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "ts_ls", -- TypeScript/JavaScript (formerly tsserver)
          "eslint", -- ESLint
          "html", -- HTML
          "cssls", -- CSS
          "tailwindcss", -- Tailwind CSS
          "jsonls", -- JSON
        },
        automatic_installation = true,
      }
    end,
  },

  -- nvim-lspconfig for LSP integration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Only load if using older Neovim version
      if vim.fn.has "nvim-0.11" == 0 then
        require("nvchad.configs.lspconfig").defaults()
      end
      require "configs.lspconfig"
    end,
  },

  -- conform.nvim for formatting (better than null-ls)
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require("conform").setup {
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          lua = { "stylua" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      }
    end,
  },

  -- nvim-cmp for autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require "cmp"
      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
        mapping = cmp.mapping.preset.insert {
          ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Scroll up in docs
          ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Scroll down in docs
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        },
      }
    end,
  },

  -- Mason tool installer for formatters and linters
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          "prettier", -- Formatter
          "stylua", -- Lua formatter
          "eslint_d", -- ESLint daemon (faster)
        },
        auto_update = true,
        run_on_start = true,
      }
    end,
  },

  -- Markdown previewer with proper checkbox rendering
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" },
    config = function()
      require("render-markdown").setup {
        heading = {
          enabled = true,
          sign = true,
          icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        },
        code = {
          enabled = true,
          sign = true,
          style = "full",
          left_pad = 2,
          right_pad = 2,
        },
        checkbox = {
          enabled = true,
          unchecked = {
            icon = "󰄱 ",
            highlight = "RenderMarkdownUnchecked",
          },
          checked = {
            icon = "󰱒 ",
            highlight = "RenderMarkdownChecked",
          },
          custom = {
            todo = {
              raw = "[-]",
              rendered = "󰥔 ",
              highlight = "RenderMarkdownTodo",
            },
          },
        },
        bullet = {
          enabled = true,
          icons = { "●", "○", "◆", "◇" },
        },
        table = {
          enabled = true,
          style = "full",
        },
        link = {
          enabled = true,
          image = "󰥶 ",
          hyperlink = "󰌹 ",
        },
        quote = {
          enabled = true,
          icon = "▋",
        },
      }
    end,
  },
}
