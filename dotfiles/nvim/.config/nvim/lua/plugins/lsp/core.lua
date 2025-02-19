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

M.on_attach = function(_client, bufnr)
  local opts = { buffer = bufnr, silent = true }
  local keymap = vim.keymap
  opts.desc = "LSP Rename"
  keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

  opts.desc = "Go to declaration"
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

  opts.desc = "Show LSP Signature"
  keymap.set({ "i", "v" }, "<C-k>", vim.lsp.buf.signature_help, opts) -- show lsp function signature

  opts.desc = "See available code actions"
  keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

  opts.desc = "Show line diagnostics"
  keymap.set("n", "<leader>xd", vim.diagnostic.open_float, opts) -- show diagnostics for line

  opts.desc = "Go to previous diagnostic"
  keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

  opts.desc = "Go to next diagnostic"
  keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

  opts.desc = "Show documentation for what is under cursor"
  keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

  opts.desc = "LSP Info"
  keymap.set("n", "<leader>li", ":LspInfo<CR>", opts) -- mapping to restart lsp if necessary
end

return M
