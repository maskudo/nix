local M = {}
local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local has_blink, blink = pcall(require, "blink.cmp")
M.capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  has_cmp and cmp_nvim_lsp.default_capabilities() or {},
  has_blink and blink.get_lsp_capabilities() or {}
)

M.on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, silent = true }
  local keymap = vim.keymap

  opts.desc = "Show line diagnostics"
  keymap.set("n", "<leader>xd", vim.diagnostic.open_float, opts) -- show diagnostics for line

  -- opts.desc = "Go to previous diagnostic"
  -- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  --
  -- opts.desc = "Go to next diagnostic"
  -- keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

  --
end

return M
