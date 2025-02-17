local C = require("plugins.lsp.core")

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = C.capabilities
local on_attach = C.on_attach

mason_lspconfig.setup_handlers({
  -- default handler for installed servers
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
  ["lua_ls"] = function()
    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })
  end,
  ["vtsls"] = function()
    lspconfig["vtsls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        vtsls = {
          experimental = {
            completion = {
              enableServerSideFuzzyMatch = true,
              entriesLimit = 10,
            },
          },
        },
      },
    })
  end,
  ["markdown_oxide"] = function()
    lspconfig["markdown_oxide"].setup({
      on_attach = on_attach,
      capabilities = vim.tbl_deep_extend("force", capabilities, {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      }),
    })
  end,
  ["tailwindcss"] = function()
    lspconfig["tailwindcss"].setup({
      on_attach = on_attach,
      root_dir = function(fname)
        local root_pattern = require("lspconfig").util.root_pattern(
          "tailwind.config.cjs",
          "tailwind.config.js",
          "postcss.config.js"
        )
        return root_pattern(fname)
      end,
    })
  end,
})

lspconfig.nixd.setup({
  on_attach = on_attach,
  cmd = { "nixd" },
  filetypes = { "nix" },
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern(
    "default.nix",
    "shell.nix",
    "flake.nix",
    ".git"
  ),
  settings = {},
})

lspconfig.racket_langserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
