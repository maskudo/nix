local rosepine = {
  base00 = "#232136",
  base01 = "#2a273f",
  base02 = "#393552",
  base03 = "#6e6a86",
  base04 = "#908caa",
  base05 = "#e0def4",
  base06 = "#e0def4",
  base07 = "#56526e",
  base08 = "#eb6f92",
  base09 = "#f6c177",
  base0A = "#ea9a97",
  base0B = "#3e8fb0",
  base0C = "#9ccfd8",
  base0D = "#c4a7e7",
  base0E = "#f6c177",
  base0F = "#524f67",
}

---@diagnostic disable-next-line: unused-local
local _catppuccinmocha = {
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

-- require("mini.base16").setup({
-- 	palette = rosepine,
-- })

vim.keymap.set("n", "<leader>ue", function()
  vim.ui.input({ prompt = "Enter Colorscheme Name:" }, function(colorscheme)
    if not colorscheme then
      return
    end
    require("mini.colors").get_colorscheme():write({ name = colorscheme })
  end)
end, { desc = "Extract Colorscheme" })

-- vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none", fg = "#585b70" })
-- vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none", fg = "#585b70" })
-- vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#cdd6f4" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsUntracked", { bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsStagedAdd", { bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsStagedAddLn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsStagedAddNr", { bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsStagedAddCul", { bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsStagedChange", { bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsStagedDelete", { bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsStagedChangeLn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsStagedChangeNr", { bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsStagedDeleteNr", { bg = "none" })
-- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#313244" })
--
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
--
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
-- vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
-- vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
