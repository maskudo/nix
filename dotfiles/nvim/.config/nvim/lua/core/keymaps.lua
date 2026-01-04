local map = require("helpers.keys").map

-- map("n", ":w<CR>", ":update<CR>", "Update")
-- map("n", ":W<CR>", ":update<CR>", "Update")

--better movement
-- map("n", "<C-u>", "<C-u>zz", "Move up by half page")
-- map("n", "<C-d>", "<C-d>zz", "Mode down by half page")
map("n", "n", "nzzzv", "Jump to Next")
map("n", "N", "Nzzzv", "Jump to Prev")

-- Quick access to some common actions
map("n", "<leader>fw", "<cmd>noa up<cr>", "Write(w/o format on save)")
map("n", "<leader>fa", "<cmd>wa<cr>", "Write all")
map("n", "<leader>fu", "<cmd>up<cr>", "Update file")
map("n", "<leader>fN", "<cmd>enew<cr>", "New File")
map("n", "<leader>fx", "<cmd>!chmod +x %<cr>", "Make File Executable")
map("n", "<leader>fe", "<cmd>e!<cr>", "Reset buffer")

map("n", "<leader>qq", "<cmd>q<cr>", "Quit")
map("n", "<leader>qa", "<cmd>qa!<cr>", "Quit all")

map("n", "gX", ":silent !xdg-open <cfile><CR>", "Open link")
map("n", "gl", ":silent !xdg-open <cfile><CR>", "Open link")

-- Easier access to beginning and end of lines
map({ "n", "v" }, "<S-h>", "^", "Go to beginning of line")
map({ "n", "v" }, "<S-l>", "$", "Go to end of line")

-- Better window navigation
map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")
map("n", "<C-f>", "<C-w>w", "Focus window")
--
-- Better tab navigation
map("n", "<leader>tt", ":tabnew<CR>", "New Tab")
map("n", "<leader>td", ":tabclose<CR>", "Close Tab")
map("n", "<leader>tn", ":tabnext<CR>", "Next Tab")
map("n", "<leader>tp", ":tabprevious<CR>", "Previous Tab")
map("n", "]t", ":tabnext<CR>")
map("n", "[t", ":tabprevious<CR>")

-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Navigate quickfix list
map("n", "[q", ":cprev<CR>")
map("n", "]q", ":cnext<CR>")
map("n", "<C-q>", ":clist<CR>")

-- Navigate buffers
map("n", "<leader>bp", ":buffer #<CR>", "Previous Buffer")
map("n", "]b", ":bnext<CR>")
map("n", "[b", ":bprevious<CR>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", "Escape and clear hlsearch")

-- Move text up and down
map("v", "p", '"_dP', "Paste")
map("n", "x", [["_x]], "Delete letter")

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", "Move text down")
map("x", "K", ":move '<-2<CR>gv-gv", "Move text up")

-- copy to system clipboard
map("n", "<leader>y", '"+y', "Copy to system clipboard")
map("v", "<leader>y", '"+y', "Copy to system clipboard")
map("n", "<leader>Y", '"+Y', "Copy to system clipboard")

-- map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>', "Replace selected text")

--  select mode
map("s", "p", "<nop>")
map("s", "<Esc>", "<cmd>lua vim.snippet.stop()<CR><Esc>")
map("s", "<C-h>", function()
  vim.snippet.jump(-1)
end)
map("s", "<C-l>", function()
  vim.snippet.jump(1)
end)

map("n", "B", "<Plug>(MatchitNormalForward)")
map("v", "B", "<Plug>(MatchitVisualForward)")
map("n", "<leader>um", "<cmd>messages<cr>", "Messages")
