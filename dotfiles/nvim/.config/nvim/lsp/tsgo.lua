---@type vim.lsp.Config
return {
  cmd = {
    vim.env.HOME
      .. "/node_modules/@typescript/native-preview-linux-x64/lib/tsgo",
    "--lsp",
    "--stdio",
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
    ".git",
    "tsconfig.base.json",
  },
}
