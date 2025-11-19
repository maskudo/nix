local C = require("plugins.lsp.core")

local capabilities = C.capabilities
local on_attach = C.on_attach

vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = on_attach,
  root_markers = { ".git" },
})

vim.lsp.enable({ "nixd", "racket_langserver" })
-- vim.lsp.enable({ "tsgo" })
