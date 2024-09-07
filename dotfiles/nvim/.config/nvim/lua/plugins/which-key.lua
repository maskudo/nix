return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    lazy = true,
    config = function()
      local wk = require("which-key")
      wk.setup()
      wk.add(
        {
          { "<leader>f", { group = "File" } },
          { "<leader>d", { group = "Delete/Close" } },
          { "<leader>b", { group = "Buffer" } },
          { "<leader>q", { group = "Quit" } },
          { "<leader>s", { group = "Search" } },
          { "<leader>c", { group = "Code" } },
          { "<leader>u", { group = "UI" } },
          { "<leader>g", { group = "Git" } },
          { "<leader>x", { group = "Diagnostics" } },
          { "<leader>y", { group = "Yank" } },
        }
      )
    end,
  },
}
