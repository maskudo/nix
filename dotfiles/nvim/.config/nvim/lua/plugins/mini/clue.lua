local M = {}
local miniclue = require("mini.clue")
M.clues = {
  miniclue.gen_clues.builtin_completion(),
  miniclue.gen_clues.g(),
  miniclue.gen_clues.marks(),
  miniclue.gen_clues.registers(),
  miniclue.gen_clues.windows(),
  miniclue.gen_clues.z(),
  { mode = "n", keys = "<leader>g", desc = "Git" },
  { mode = "n", keys = "<leader>f", desc = "File" },
  { mode = "n", keys = "<leader>D", desc = "Database" },
  { mode = "n", keys = "<leader>d", desc = "Debugger" },
  { mode = "n", keys = "<leader>b", desc = "Buffer" },
  { mode = "n", keys = "<leader>l", desc = "LSP" },
  { mode = "n", keys = "<leader>q", desc = "Quit" },
  { mode = "n", keys = "<leader>s", desc = "Search" },
  { mode = "n", keys = "<leader>c", desc = "Code" },
  { mode = "n", keys = "<leader>u", desc = "UI" },
  { mode = "n", keys = "<leader>g", desc = "Git" },
  { mode = "n", keys = "<leader>x", desc = "Diagnostics" },
  { mode = "n", keys = "<leader>y", desc = "Yank" },
  { mode = "n", keys = "<leader>t", desc = "Tab" },
}

M.triggers = {
  -- Leader triggers
  { mode = "n", keys = "<Leader>" },
  { mode = "x", keys = "<Leader>" },
  { mode = "x", keys = "<Leader>b", desc = "Buffer" },

  -- Built-in completion
  { mode = "i", keys = "<C-x>" },

  -- `g` key
  { mode = "n", keys = "g" },
  { mode = "x", keys = "g" },

  -- Marks
  { mode = "n", keys = "'" },
  { mode = "n", keys = "`" },
  { mode = "x", keys = "'" },
  { mode = "x", keys = "`" },

  -- Registers
  { mode = "n", keys = '"' },
  { mode = "x", keys = '"' },
  { mode = "i", keys = "<C-r>" },
  { mode = "c", keys = "<C-r>" },

  -- Window commands
  { mode = "n", keys = "<C-w>" },

  -- `z` key
  { mode = "n", keys = "z" },
  { mode = "x", keys = "z" },
}
require("mini.clue").setup({
  triggers = M.triggers,
  clues = M.clues,
  window = {
    delay = 300,
    scroll_down = "<C-j>",
    scroll_up = "<C-k>",
    config = {
      width = 50,
    },
  },
})

return M
