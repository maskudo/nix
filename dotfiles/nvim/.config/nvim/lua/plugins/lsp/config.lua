local C = require("plugins.lsp.core")

local capabilities = C.capabilities
local on_attach = C.on_attach

require("mason-lspconfig").setup({
  automatic_enable = true,
})

vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = on_attach,
  root_markers = { ".git" },
})

vim.lsp.enable({ "nixd", "racket_langserver" })
