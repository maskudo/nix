return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  event = "VeryLazy",
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ansiblels",
        "clangd",
        "cssls",
        "dockerls",
        "emmet_ls",
        "eslint",
        "gopls",
        "lua_ls",
        "markdown_oxide",
        "nil_ls",
        "pyright",
        "rust_analyzer",
        "tailwindcss",
        "tsserver",
        "terraformls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "ansible-lint",
        "black", -- python formatter
        "eslint_d",
        "flake8",
        "gofumpt",
        "mypy",
        "prettier", -- prettier formatter
        "pylint",
        "pyright",
        "ruff",
        "shellcheck",
        "shfmt",
        "stylua", -- lua formatter
        "tflint",
        -- debuggers
        "js-debug-adapter",
      },
    })
  end,
}
