return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
          "mason-org/mason.nvim",
        },
      },
    },
    config = function()
      require("plugins.lsp.handlers")
      require("plugins.lsp.config")
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
    dependencies = {
      { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    },
  },
}
