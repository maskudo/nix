local label = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
local file = vim.fn.stdpath("state") .. "/visits/" .. label .. ".visits.vim"

local Visits = require("mini.visits")
Visits.setup({
  store = {
    path = file,
  },
})

vim.keymap.set("n", "<leader>pa", function()
  Visits.add_label(label)
end, { desc = "Add Label(cwd)" })

vim.keymap.set("n", "<leader>pA", function()
  Visits.add_label(label)
end, { desc = "Add Label" })

vim.keymap.set("n", "<leader>pd", function()
  Visits.remove_label(label)
end, { desc = "Remove Label" })

vim.keymap.set("n", "<leader>ps", function()
  require("mini.extra").pickers.visit_paths({ filter = label })
end, { desc = "Vist Labels (cwd)" })

vim.keymap.set("n", "<leader>pS", function()
  Visits.select_label()
end, { desc = "Visit Labels" })

vim.keymap.set("n", "<leader>pC", function()
  Visits.reset_index()
end, { desc = "Reset Labels" })
