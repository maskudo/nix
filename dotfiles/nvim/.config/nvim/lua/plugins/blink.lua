return {
  {
    "saghen/blink.cmp",
    enabled = true,
    event = "BufReadPre",
    version = "*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    ---
    opts = {
      keymap = {
        preset = "super-tab",
      },
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "dadbod",
        },
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },
    },
    opts_extend = { "sources.completion.enabled_providers" },
  },
  {
    "chrisgrieser/nvim-scissors",
    lazy = true,
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },
    keys = {
      {
        "<leader>csa",
        function()
          require("scissors").addNewSnippet()
        end,
        desc = "Add Snippet",
        mode = { "n", "x" },
      },
      {
        "<leader>cse",
        function()
          require("scissors").editSnippet()
        end,
        desc = "Edit Snippets",
        mode = { "n", "x" },
      },
    },
  },
}
