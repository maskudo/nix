local map = require("helpers.keys").map

--better movement
map("n", "<C-u>", "<C-u>zz", "Move up by half page")
map("n", "<C-d>", "<C-d>zz", "Mode down by half page")
map("n", "n", "nzzzv", "Jump to Next")
map("n", "N", "Nzzzv", "Jump to Prev")

-- Quick access to some common actions
map("n", "<leader>fw", "<cmd>noa up<cr>", "Write(w/o format on save)")
map("n", "<leader>fa", "<cmd>wa<cr>", "Write all")
map("n", "<leader>fu", "<cmd>up<cr>", "Update file")
map("n", "<leader>fn", "<cmd>enew<cr>", "New File")
map("n", "<leader>fx", "<cmd>!chmod +x %<cr>", "Make File Executable")
map("n", "<leader>qq", "<cmd>q<cr>", "Quit")
map("n", "<leader>qa", "<cmd>qa!<cr>", "Quit all")

map("n", "gx", ":silent !xdg-open <cfile><CR>", "Open link")

-- Easier access to beginning and end of lines
map("n", "<M-h>", "^", "Go to beginning of line")
map("n", "<M-l>", "$", "Go to end of line")

-- Better window navigation
map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")
--
-- Better tab navigation
map("n", "<leader>tt", ":tabnew<CR>", "New Tab")
map("n", "<leader>td", ":tabclose<CR>", "Close Tab")
map("n", "<leader>tn", ":tabnext<CR>", "Next Tab")
map("n", "<leader>tp", ":tabprevious<CR>", "Previous Tab")

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
map("n", "<C-p>", ":cprev<CR>")
map("n", "<C-n>", ":cnext<CR>")

-- Deleting buffers
local buffers = require("helpers.buffers")
map("n", "<leader>bd", buffers.delete_this, "Delete CurrentBbuffer")
map("n", "<leader>bo", buffers.delete_others, "Delete Other Buffers")
map("n", "<leader>ba", buffers.delete_all, "Delete All buffers")
map("n", "<leader>bp", ":buffer #<CR>", "Previous Buffer")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Switch between light and dark modes
map("n", "<leader>ut", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, "Toggle between light and dark themes")

-- Clear after search
map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")

-- map("n", "gD", ":lua", "Goto Declaration")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", "Escape and clear hlsearch")

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", "Move text down")
map("v", "<A-k>", ":m .-2<CR>==", "Move text up")
map("v", "p", '"_dP', "Paste")

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", "Move text down")
map("x", "K", ":move '<-2<CR>gv-gv", "Move text up")
map("x", "<A-j>", ":move '>+1<CR>gv-gv", "Move text down")
map("x", "<A-k>", ":move '<-2<CR>gv-gv", "Move text up")

-- copy to system clipboard
map("n", "<leader>y", '"+y', "Copy to system clipboard")
map("v", "<leader>y", '"+y', "Copy to system clipboard")
map("n", "<leader>Y", '"+Y', "Copy to system clipboard")

map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
