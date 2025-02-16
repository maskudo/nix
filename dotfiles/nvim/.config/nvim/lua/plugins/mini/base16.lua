local rosepine = {
	base00 = "#191724",
	base01 = "#1f1d2e",
	base02 = "#26233a",
	base03 = "#6e6a86",
	base04 = "#908caa",
	base05 = "#e0def4",
	base06 = "#e0def4",
	base07 = "#524f67",
	base08 = "#eb6f92",
	base09 = "#f6c177",
	base0A = "#ebbcba",
	base0B = "#31748f",
	base0C = "#9ccfd8",
	base0D = "#c4a7e7",
	base0E = "#f6c177",
	base0F = "#524f67",
}

---@diagnostic disable-next-line: unused-local
local catppuccinmocha = {
	base00 = "#1e1e2e",
	base01 = "#181825",
	base02 = "#313244",
	base03 = "#45475a",
	base04 = "#585b70",
	base05 = "#cdd6f4",
	base06 = "#f5e0dc",
	base07 = "#b4befe",
	base08 = "#f38ba8",
	base09 = "#fab387",
	base0A = "#f9e2af",
	base0B = "#a6e3a1",
	base0C = "#94e2d5",
	base0D = "#89b4fa",
	base0E = "#cba6f7",
	base0F = "#f2cdcd",
}

require("mini.base16").setup({
	palette = rosepine,
})

vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none", fg = "#585b70" })
vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none", fg = "#585b70" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#cdd6f4" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsUntracked", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsStagedAdd", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsStagedAddLn", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsStagedAddNr", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsStagedAddCul", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsStagedChange", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsStagedDelete", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsStagedChangeLn", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsStagedChangeNr", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsStagedDeleteNr", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#313244" })
