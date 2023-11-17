return {
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")
      wk.setup()
      wk.register({
        ["<leader>"] = {
          f = { name = "File" },
          d = { name = "Delete/Close" },
          b = { name = "Buffer" },
          q = { name = "Quit" },
          s = { name = "Search" },
          c = { name = "Code" },
          u = { name = "UI" },
          g = { name = "Git" },
          x = { name = "Diagnostics" },
          y = { name = "Yank" },
        },
      })
    end,
  },
}
