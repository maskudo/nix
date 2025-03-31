local function use_biome(bufnr)
  local path = vim.api.nvim_buf_get_name(bufnr)
  if path:find("autolink") then
    return { "biome" }
  end
  if path:find("work/") then
    return { "prettierd" }
  else
    return { "biome" }
  end
end
return {
  "stevearc/conform.nvim",
  event = "BufReadPost",
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters = {
        ["sql-formatter"] = {
          command = "sql-formatter",
          args = { "--config", '{"keywordCase" : "upper"}' },
          stdin = true, -- Enable stdin to allow formatting from the buffer directly
        },
      },
      formatters_by_ft = {
        javascript = use_biome,
        typescript = use_biome,
        javascriptreact = use_biome,
        typescriptreact = use_biome,
        svelte = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        graphql = { "prettierd" },
        liquid = { "prettierd" },
        markdown = { "prettierd" },
        lua = { "stylua" },
        python = { "isort", "black" },
        nix = { "nixfmt" },
        rust = { "rustfmt" },
        go = { "gofumpt" },
        -- sql = { "sql-formatter" },
        bash = { "shfmt" },
        sh = { "shfmt" },
        racket = {
          format = function(bufnr)
            return {
              cmd = "raco",
              args = { "fmt", "-i", vim.api.nvim_buf_get_name(bufnr) },
              stdin = false,
            }
          end,
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 300,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
