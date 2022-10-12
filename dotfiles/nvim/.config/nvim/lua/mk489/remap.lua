local map = require("mk489.utils").map
map("n", "<Leader>f", ":FzfLua files<CR>", { silent = true })
map("n", "<Leader>w", ":LspZeroFormat<CR>", { silent = true })
