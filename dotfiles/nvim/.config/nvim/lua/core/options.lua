local opts = {
  autowrite = true,
  clipboard = "unnamedplus",
  completeopt = "menu,menuone,noinsert",
  conceallevel = 2,
  confirm = true,
  cursorline = true,
  expandtab = true,
  formatoptions = "jcroqlnt",
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  foldenable = false,
  grepformat = "%f:%l:%c:%m",
  -- colorcolumn = "80",
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
  softtabstop = 2,
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
  exrc = true,
  secure = true,
  sessionoptions = "buffers",
  shadafile = vim.fn.stdpath("cache") .. "/shada/" .. vim.fn.fnamemodify(
    vim.fn.getcwd(),
    ":t"
  ) .. ".shada",
}
-- Set options from table
for opt, val in pairs(opts) do
  vim.o[opt] = val
end

local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)
