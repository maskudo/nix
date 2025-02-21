-- require("mini.completion").setup({
--   delay = {
--     completion = 10000,
--   },
-- })
vim.keymap.set("i", "<c-space>", "<c-x><c-o>", { desc = "Autocomplete" })
local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
  snippets = {
    -- Load custom file with global snippets first (adjust for Windows)
    gen_loader.from_runtime("~/.config/nvim/snippets"),

    -- Load snippets based on current language by reading files from
    -- "snippets/" subdirectories from 'runtimepath' directories.
    gen_loader.from_lang(),
  },
})
