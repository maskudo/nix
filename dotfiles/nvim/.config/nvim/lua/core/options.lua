local opts = {
	autowrite = true,
	clipboard = "unnamedplus",
	completeopt = "menu,menuone,noselect",
	conceallevel = 3,
	confirm = true,
	cursorline = true,
	expandtab = true,
	formatoptions = "jcroqlnt",
	grepformat = "%f:%l:%c:%m",
	grepprg = "rg",
	ignorecase = true,
	mouse = "a",
	number = true,
	relativenumber = true,
	scrolloff = 4,
	shiftwidth = 2,
	sidescrolloff = 8,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitkeep = "screen",
	splitright = true,
	tabstop = 2,
	termguicolors = true,
	timeoutlen = 300,
	undofile = true,
	undolevels = 10000,
	updatetime = 200,
	virtualedit = "block",
	wildmode = "longest:full,full",
	winminwidth = 5,
	wrap = false,
	fillchars = "eob: ",
}

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)
