local map = require("mk489.utils").map
local builtin = require('telescope.builtin')

--map("n", "<Leader>f", ":FzfLua files<CR>", { silent = true })
map("n", "<Leader>w", ":LspZeroFormat<CR>", { silent = true })
map("i", "jk", "<Esc>", { silent = true })
map("i", "kj", "<Esc>", { silent = true })

--telescope remaps 
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
