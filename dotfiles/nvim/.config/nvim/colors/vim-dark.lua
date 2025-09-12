-- Made with 'mini.colors' module of https://github.com/echasnovski/mini.nvim

if vim.g.colors_name ~= nil then
  vim.cmd("highlight clear")
end
vim.g.colors_name = "vim-dark"

-- Highlight groups
local hi = vim.api.nvim_set_hl

hi(0, "@attribute.builtin", { link = "VD_MediumGray" })
hi(0, "@comment.error", { link = "Comment" })
hi(0, "@comment.note", { link = "Comment" })
hi(0, "@comment.todo", { link = "Comment" })
hi(0, "@comment.warning", { link = "Comment" })
hi(0, "@constant.builtin", { link = "VD_MediumGray" })
hi(0, "@constructor", { link = "VD_SoftWhite" })
hi(0, "@diff.delta", { link = "VD_Blue" })
hi(0, "@diff.minus", { link = "VD_Red" })
hi(0, "@diff.plus", { link = "VD_Green" })
hi(0, "@function.builtin", { link = "VD_SoftWhite" })
hi(0, "@keyword.modifier", { link = "VD_MediumDarkGray" })
hi(0, "@keyword.type", { link = "VD_MediumDarkGray" })
hi(0, "@lsp.type.class", { link = "VD_MediumGray" })
hi(0, "@lsp.type.keyword", { link = "VD_MediumDarkGray" })
hi(0, "@lsp.type.macro", { link = "VD_MediumGray" })
hi(
  0,
  "@markup.heading.1.delimiter.vimdoc",
  { nocombine = true, sp = "#c0c0ca", underdouble = true }
)
hi(
  0,
  "@markup.heading.2.delimiter.vimdoc",
  { nocombine = true, sp = "#c0c0ca", underline = true }
)
hi(0, "@module.builtin", { link = "VD_MediumGray" })
hi(0, "@punctuation.bracket", { link = "VD_MediumGray" })
hi(0, "@punctuation.delimiter", { link = "VD_MediumDarkGray" })
hi(0, "@punctuation.special", { link = "VD_MediumGray" })
hi(0, "@string.escape", { link = "VD_MediumGray" })
hi(0, "@tag", { link = "VD_MediumGray" })
hi(0, "@tag.attribute", { link = "VD_SoftWhite" })
hi(0, "@tag.builtin", { link = "VD_MediumGray" })
hi(0, "@tag.delimiter", { link = "VD_MediumGray" })
hi(0, "@type", { link = "VD_MediumGray" })
hi(0, "@type.builtin", { link = "VD_MediumGray" })
hi(0, "@type.sql", { link = "VD_SoftWhite" })
hi(0, "@type.vim", { link = "VD_SoftWhite" })
hi(0, "@variable", { ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" })
hi(0, "@variable.builtin", { link = "VD_SoftWhite" })
hi(0, "@variable.parameter.builtin", { link = "VD_SoftWhite" })
-- hi(0, "@variable.member", { fg = "#5d5d5d" })
hi(0, "Boolean", { link = "VD_SoftWhite" })
hi(0, "ColorColumn", { bg = "#1a1a1a", ctermbg = 0 })
hi(0, "Comment", { ctermbg = 0, ctermfg = 7, fg = "#44444a" })
hi(0, "Conditional", { link = "VD_LightGray" })
hi(0, "Constant", { ctermbg = 0, ctermfg = 7, fg = "#aaaaaa" })
hi(
  0,
  "CurSearch",
  { bg = "#44444a", ctermbg = 0, ctermfg = 15, fg = "#ffffff" }
)
hi(0, "Cursor", { bg = "#ffffff", ctermbg = 15, ctermfg = 0, fg = "#2a2a2a" })
hi(0, "CursorIM", { link = "VD_BlackOnWhite" })
hi(0, "CursorLine", { bg = "#20202a", ctermbg = 0 })
hi(0, "CursorLineNr", { bg = "#20202a", ctermbg = 0, fg = "#5d5d80" })
hi(0, "CursorLineSign", { link = "VD_BackgroundVoid" })
hi(0, "Debug", { link = "VD_SoftWhite" })
hi(0, "Define", { link = "VD_LightGray" })
hi(0, "Delimiter", { ctermbg = 0, ctermfg = 7, fg = "#5d5d5d" })
hi(0, "DiagnosticError", { ctermbg = 0, ctermfg = 15, fg = "#ffffff" })
hi(0, "DiagnosticHint", { ctermbg = 0, ctermfg = 7, fg = "#5d5d5d" })
hi(0, "DiagnosticInfo", { ctermbg = 0, ctermfg = 7, fg = "#5d5d5d" })
hi(0, "DiagnosticSignError", { link = "VD_White" })
hi(0, "DiagnosticSignHint", { link = "VD_MediumDarkGray" })
hi(0, "DiagnosticSignInfo", { link = "VD_MediumDarkGray" })
hi(0, "DiagnosticSignWarn", { link = "VD_NearWhite" })
hi(0, "DiagnosticWarn", { ctermbg = 0, ctermfg = 7, fg = "#f5f5f5" })
hi(0, "DiffAdd", { ctermbg = 0, ctermfg = 7, fg = "#aaaaaa" })
hi(0, "DiffChange", { ctermbg = 0, ctermfg = 7, fg = "#5d5d5d" })
hi(0, "DiffText", { ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" })
hi(0, "Directory", { ctermbg = 0, ctermfg = 7, fg = "#aaaaaa" })
hi(0, "EasyMotionShade", { link = "VD_MediumDarkGray" })
hi(0, "EasyMotionTarget", { link = "VD_NearWhiteOnDarkGray" })
hi(0, "EasyMotionTarget2First", { link = "VD_NearWhiteOnDarkGray" })
hi(0, "EasyMotionTarget2Second", { link = "VD_NearWhiteOnDarkGray" })
hi(0, "Error", { bg = "#44444a", ctermbg = 0, ctermfg = 15, fg = "#ffffff" })
hi(0, "ErrorMsg", { bg = "#44444a", ctermbg = 0, ctermfg = 15, fg = "#ffffff" })
hi(0, "Exception", { link = "VD_SoftWhite" })
hi(0, "FoldColumn", { link = "VD_SoftWhite" })
hi(0, "Function", { ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" })
hi(0, "GitSignsAdd", { fg = "#9ccfd8" })
hi(0, "GitSignsChange", { fg = "#ebbcba" })
hi(0, "GitSignsDelete", { fg = "#eb6f92" })
hi(0, "GitSignsStagedAdd", { fg = "#4e676c" })
hi(0, "GitSignsStagedAddCul", { fg = "#4e676c" })
hi(0, "GitSignsStagedAddLn", { bg = "#333c48" })
hi(0, "GitSignsStagedAddNr", { fg = "#4e676c" })
hi(0, "GitSignsStagedChange", { fg = "#755e5d" })
hi(0, "GitSignsStagedChangeCul", { fg = "#755e5d" })
hi(0, "GitSignsStagedChangeLn", { bg = "#433842" })
hi(0, "GitSignsStagedChangeNr", { fg = "#755e5d" })
hi(0, "GitSignsStagedChangedelete", { fg = "#755e5d" })
hi(0, "GitSignsStagedChangedeleteCul", { fg = "#755e5d" })
hi(0, "GitSignsStagedChangedeleteLn", { bg = "#433842" })
hi(0, "GitSignsStagedChangedeleteNr", { fg = "#755e5d" })
hi(0, "GitSignsStagedDelete", { fg = "#753749" })
hi(0, "GitSignsStagedDeleteCul", { fg = "#753749" })
hi(0, "GitSignsStagedDeleteNr", { fg = "#753749" })
hi(0, "GitSignsStagedTopdelete", { fg = "#753749" })
hi(0, "GitSignsStagedTopdeleteCul", { fg = "#753749" })
hi(0, "GitSignsStagedTopdeleteNr", { fg = "#753749" })
hi(0, "GitSignsStagedUntracked", { fg = "#4e676c" })
hi(0, "GitSignsStagedUntrackedCul", { fg = "#4e676c" })
hi(0, "GitSignsStagedUntrackedLn", { bg = "#333c48" })
hi(0, "GitSignsStagedUntrackedNr", { fg = "#4e676c" })
hi(0, "Identifier", { ctermbg = 0, ctermfg = 7, fg = "#aaaaaa" })
hi(0, "IncSearch", { link = "VD_NearWhiteOnDarkGray" })
hi(0, "Include", { link = "VD_LightGray" })
hi(0, "Keyword", { link = "VD_MediumDarkGray" })
hi(0, "Label", { link = "VD_LightGray" })
hi(0, "LazyInfo", { link = "VD_MediumGray" })
hi(0, "LazyReasonPlugin", { link = "VD_LightGray" })
hi(0, "LineNr", { ctermbg = 0, ctermfg = 7, fg = "#44444a" })
hi(0, "LspSigActiveParameter", { link = "ErrorMsg" })
hi(0, "Macro", { link = "VD_SoftWhite" })
hi(
  0,
  "MatchParen",
  { bg = "#3f3f3f", ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" }
)
hi(
  0,
  "MiniHipatternsFixme",
  { bold = true, ctermbg = 0, ctermfg = 15, fg = "#ffffff", reverse = true }
)
hi(
  0,
  "MiniHipatternsHack",
  { bold = true, ctermbg = 0, ctermfg = 7, fg = "#f5f5f5", reverse = true }
)
hi(
  0,
  "MiniHipatternsNote",
  { bold = true, ctermbg = 0, ctermfg = 7, fg = "#5d5d5d", reverse = true }
)
hi(
  0,
  "MiniHipatternsTodo",
  { bold = true, ctermbg = 0, ctermfg = 7, fg = "#5d5d5d", reverse = true }
)
hi(0, "MiniHipatterns_000000_bg", { bg = "#000000", fg = "#ffffff" })
hi(0, "MiniHipatterns_00000b_bg", { bg = "#00000b", fg = "#ffffff" })
hi(0, "MiniHipatterns_0f0c0e_bg", { bg = "#0f0c0e", fg = "#ffffff" })
hi(0, "MiniHipatterns_11100f_bg", { bg = "#11100f", fg = "#ffffff" })
hi(0, "MiniHipatterns_1e1e1e_bg", { bg = "#1e1e1e", fg = "#ffffff" })
hi(0, "MiniHipatterns_26233a_bg", { bg = "#26233a", fg = "#ffffff" })
hi(0, "MiniHipatterns_313244_bg", { bg = "#313244", fg = "#ffffff" })
hi(0, "MiniHipatterns_333c48_bg", { bg = "#333c48", fg = "#ffffff" })
hi(0, "MiniHipatterns_3b401f_bg", { bg = "#3b401f", fg = "#ffffff" })
hi(0, "MiniHipatterns_433842_bg", { bg = "#433842", fg = "#ffffff" })
hi(0, "MiniHipatterns_4e676c_bg", { bg = "#4e676c", fg = "#ffffff" })
hi(0, "MiniHipatterns_585b70_bg", { bg = "#585b70", fg = "#ffffff" })
hi(0, "MiniHipatterns_753749_bg", { bg = "#753749", fg = "#ffffff" })
hi(0, "MiniHipatterns_755e5d_bg", { bg = "#755e5d", fg = "#ffffff" })
hi(0, "MiniHipatterns_8cbe8c_bg", { bg = "#8cbe8c", fg = "#000000" })
hi(0, "MiniHipatterns_908caa_bg", { bg = "#908caa", fg = "#000000" })
hi(0, "MiniHipatterns_95b1ac_bg", { bg = "#95b1ac", fg = "#000000" })
hi(0, "MiniHipatterns_9ccfd8_bg", { bg = "#9ccfd8", fg = "#000000" })
hi(0, "MiniHipatterns_c4a7e7_bg", { bg = "#c4a7e7", fg = "#000000" })
hi(0, "MiniHipatterns_cdd6f4_bg", { bg = "#cdd6f4", fg = "#000000" })
hi(0, "MiniHipatterns_d19ebc_bg", { bg = "#d19ebc", fg = "#000000" })
hi(0, "MiniHipatterns_e0def4_bg", { bg = "#e0def4", fg = "#000000" })
hi(0, "MiniHipatterns_eb6f92_bg", { bg = "#eb6f92", fg = "#000000" })
hi(0, "MiniHipatterns_ebbcba_bg", { bg = "#ebbcba", fg = "#000000" })
hi(0, "MiniHipatterns_f6c177_bg", { bg = "#f6c177", fg = "#000000" })
hi(0, "MiniHipatterns_ffcc33_bg", { bg = "#ffcc33", fg = "#000000" })
hi(0, "MiniStatuslineDevinfo", { link = "VD_SoftWhiteOnVoid" })
hi(0, "MiniStatuslineFileinfo", { link = "VD_SoftWhiteOnVoid" })
hi(0, "MiniStatuslineFilename", { link = "VD_SoftWhiteOnVoid" })
hi(0, "MiniStatuslineModeCommand", { link = "VD_BlackOnRed" })
hi(0, "MiniStatuslineModeInsert", { link = "VD_BlackOnGreen" })
hi(0, "MiniStatuslineModeNormal", { link = "VD_BlackOnDarkGray" })
hi(0, "MiniStatuslineModeOther", { link = "VD_BlackOnRed" })
hi(0, "MiniStatuslineModeReplace", { link = "VD_BlackOnBlue" })
hi(0, "MiniStatuslineModeVisual", { link = "VD_BlackOnBlue" })
hi(0, "ModeMsg", { ctermbg = 0, ctermfg = 7, fg = "#5d5d5d" })
hi(0, "MoreMsg", { ctermbg = 0, ctermfg = 7, fg = "#5d5d5d" })
hi(0, "MsgArea", { link = "VD_MediumDarkGray" })
hi(0, "NoiceFormatProgressDone", { bg = "#44444a", fg = "#f5f5f5" })
hi(0, "NoiceHiddenCursor", { blend = 100, nocombine = true })
hi(0, "NonText", { ctermbg = 0, ctermfg = 7, fg = "#5d5d5d" })
hi(0, "Normal", { ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" })
hi(0, "Number", { link = "VD_SoftWhite" })
hi(0, "OilChange", { link = "VD_Blue" })
hi(0, "OilCopy", { link = "VD_Blue" })
hi(0, "OilCreate", { link = "VD_Green" })
hi(0, "OilDelete", { link = "VD_Red" })
hi(0, "OilDir", { link = "VD_LightGray" })
hi(0, "OilDirHidden", { link = "VD_MediumGray" })
hi(0, "OilFile", { link = "VD_SoftWhite" })
hi(0, "OilFileHidden", { link = "VD_MediumGray" })
hi(0, "OilHidden", { link = "VD_MediumGray" })
hi(0, "OilLink", { link = "VD_SoftWhite" })
hi(0, "OilLinkHidden", { link = "VD_MediumGray" })
hi(0, "OilMove", { link = "VD_Blue" })
hi(0, "OilOrphanLink", { link = "VD_SoftWhite" })
hi(0, "OilOrphanLinkHidden", { link = "VD_MediumGray" })
hi(0, "Operator", { ctermbg = 0, ctermfg = 7, fg = "#90909a" })
hi(0, "Pmenu", { bg = "#3f3f4f", ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" })
hi(0, "PmenuSel", { bg = "#44444a", ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" })
hi(0, "PmenuThumb", { ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" })
hi(0, "PreCondit", { link = "VD_LightGray" })
hi(0, "PreProc", { ctermbg = 0, ctermfg = 7, fg = "#aaaaaa" })
hi(0, "Question", { ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" })
hi(0, "QuickFixLine", { ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" })
hi(0, "Repeat", { link = "VD_LightGray" })
hi(0, "Search", { bg = "#44444a", ctermbg = 0, ctermfg = 7, fg = "#f5f5f5" })
hi(0, "SignColumn", { ctermbg = 0, ctermfg = 7, fg = "#5d5d5d" })
hi(0, "SnacksBackdrop", { bg = "#000000" })
hi(0, "SnacksImage11", { fg = "#3b401f", nocombine = true, sp = "#00000b" })
hi(0, "SnacksImageMath", { fg = "#9ccfd8" })
hi(0, "SnacksIndent", { fg = "#26233a" })
hi(0, "SnacksIndentBlank", { fg = "#26233a" })
hi(0, "SnacksIndentChunk", { fg = "#26233a" })
hi(0, "SnacksIndentScope", { fg = "#26233a" })
hi(0, "SnacksPickerMatch", { bold = true, fg = "#ebbcba" })
hi(0, "Special", { ctermbg = 0, ctermfg = 15, fg = "#ffffff" })
hi(0, "SpecialChar", { link = "VD_LightGray" })
hi(0, "SpecialKey", { ctermbg = 0, ctermfg = 7, fg = "#aaaaaa" })
hi(0, "SpellRare", { ctermbg = 0, ctermfg = 7, fg = "#5d5d5d" })
hi(0, "Statement", { ctermbg = 0, ctermfg = 7, fg = "#aaaaaa" })
hi(
  0,
  "StatusLine",
  { bg = "#1a1a1a", ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" }
)
hi(
  0,
  "StatusLineNC",
  { bg = "#1a1a1a", ctermbg = 0, ctermfg = 7, fg = "#7a7a8a" }
)
hi(0, "StorageClass", { link = "VD_LightGray" })
hi(0, "String", { ctermbg = 0, ctermfg = 7, fg = "#90909a" })
hi(0, "Structure", { link = "VD_LightGray" })
hi(
  0,
  "TermCursor",
  { bg = "#ffffff", ctermbg = 15, ctermfg = 0, fg = "#2a2a2a" }
)
hi(0, "Title", { ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" })
hi(0, "Todo", { ctermbg = 0, ctermfg = 7, fg = "#aaaaaa" })
hi(0, "Type", { ctermbg = 0, ctermfg = 7, fg = "#aaaaaa" })
hi(0, "Typedef", { link = "VD_LightGray" })
hi(0, "VD_BackgroundHint", { bg = "#202020", ctermbg = 0 })
hi(0, "VD_BackgroundVoid", { bg = "#1a1a1a", ctermbg = 0 })
hi(0, "VD_BalancedGray", { ctermbg = 0, ctermfg = 7, fg = "#90909a" })
hi(
  0,
  "VD_BalancedGrayOnDarkGray",
  { bg = "#44444a", ctermbg = 0, ctermfg = 7, fg = "#90909a" }
)
hi(
  0,
  "VD_BalancedGrayOnVeryDarkGray",
  { bg = "#3f3f3f", ctermbg = 0, ctermfg = 7, fg = "#90909a" }
)
hi(
  0,
  "VD_BalancedGrayOnVoid",
  { bg = "#1a1a1a", ctermbg = 0, ctermfg = 7, fg = "#90909a" }
)
hi(0, "VD_BlackOnBlue", { bg = "#a3a3c3", ctermbg = 0, fg = "#000000" })
hi(
  0,
  "VD_BlackOnDarkGray",
  { bg = "#44444a", ctermbg = 0, ctermfg = 7, fg = "#000000" }
)
hi(0, "VD_BlackOnGreen", { bg = "#a3c3a3", ctermbg = 0, fg = "#000000" })
hi(0, "VD_BlackOnRed", { bg = "#c3a3a3", ctermbg = 0, fg = "#000000" })
hi(
  0,
  "VD_BlackOnVeryDarkGray",
  { bg = "#3f3f3f", ctermbg = 0, ctermfg = 7, fg = "#000000" }
)
hi(
  0,
  "VD_BlackOnVoid",
  { bg = "#1a1a1a", ctermbg = 0, ctermfg = 7, fg = "#000000" }
)
hi(
  0,
  "VD_BlackOnWhite",
  { bg = "#ffffff", ctermbg = 15, ctermfg = 0, fg = "#2a2a2a" }
)
hi(0, "VD_Blue", { ctermbg = 0, fg = "#a3a3c3" })
hi(0, "VD_DarkGray", { ctermbg = 0, ctermfg = 7, fg = "#44444a" })
hi(
  0,
  "VD_DarkGrayOnVeryDarkGray",
  { bg = "#3f3f3f", ctermbg = 0, ctermfg = 7, fg = "#44444a" }
)
hi(
  0,
  "VD_DarkGrayOnVoid",
  { bg = "#1a1a1a", ctermbg = 0, ctermfg = 7, fg = "#44444a" }
)
hi(0, "VD_Green", { ctermbg = 0, fg = "#a3c3a3" })
hi(0, "VD_LightGray", { ctermbg = 0, ctermfg = 7, fg = "#aaaaaa" })
hi(
  0,
  "VD_LightGrayOnDarkGray",
  { bg = "#44444a", ctermbg = 0, ctermfg = 7, fg = "#aaaaaa" }
)
hi(
  0,
  "VD_LightGrayOnVeryDarkGray",
  { bg = "#3f3f3f", ctermbg = 0, ctermfg = 7, fg = "#aaaaaa" }
)
hi(
  0,
  "VD_LightGrayOnVoid",
  { bg = "#1a1a1a", ctermbg = 0, ctermfg = 7, fg = "#aaaaaa" }
)
hi(0, "VD_MediumDarkGray", { ctermbg = 0, ctermfg = 7, fg = "#5d5d6f" })
hi(
  0,
  "VD_MediumDarkGrayOnBackgroundHint",
  { bg = "#202020", ctermbg = 0, fg = "#5d5d5d" }
)
hi(
  0,
  "VD_MediumDarkGrayOnDarkGray",
  { bg = "#44444a", ctermbg = 0, ctermfg = 7, fg = "#5d5d5d" }
)
hi(
  0,
  "VD_MediumDarkGrayOnVeryDarkGray",
  { bg = "#3f3f3f", ctermbg = 0, ctermfg = 7, fg = "#5d5d5d" }
)
hi(
  0,
  "VD_MediumDarkGrayOnVoid",
  { bg = "#1a1a1a", ctermbg = 0, fg = "#5d5d5d" }
)
hi(0, "VD_MediumGray", { ctermbg = 0, ctermfg = 7, fg = "#7a7a8a" })
hi(
  0,
  "VD_MediumGrayOnDarkGray",
  { bg = "#44444a", ctermbg = 0, ctermfg = 7, fg = "#7a7a8a" }
)
hi(
  0,
  "VD_MediumGrayOnVeryDarkGray",
  { bg = "#3f3f3f", ctermbg = 0, ctermfg = 7, fg = "#7a7a8a" }
)
hi(
  0,
  "VD_MediumGrayOnVoid",
  { bg = "#1a1a1a", ctermbg = 0, ctermfg = 7, fg = "#7a7a8a" }
)
hi(0, "VD_NearWhite", { ctermbg = 0, ctermfg = 7, fg = "#f5f5f5" })
hi(
  0,
  "VD_NearWhiteOnDarkGray",
  { bg = "#44444a", ctermbg = 0, ctermfg = 7, fg = "#f5f5f5" }
)
hi(
  0,
  "VD_NearWhiteOnVeryDarkGray",
  { bg = "#3f3f3f", ctermbg = 0, ctermfg = 7, fg = "#f5f5f5" }
)
hi(
  0,
  "VD_NearWhiteOnVoid",
  { bg = "#1a1a1a", ctermbg = 0, ctermfg = 7, fg = "#f5f5f5" }
)
hi(0, "VD_Red", { ctermbg = 0, fg = "#c3a3a3" })
hi(0, "VD_SoftWhite", { ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" })
hi(
  0,
  "VD_SoftWhiteOnDarkGray",
  { bg = "#44444a", ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" }
)
hi(
  0,
  "VD_SoftWhiteOnVeryDarkGray",
  { bg = "#3f3f3f", ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" }
)
hi(
  0,
  "VD_SoftWhiteOnVoid",
  { bg = "#1a1a1a", ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" }
)
hi(0, "VD_VeryDarkGray", { ctermbg = 0, ctermfg = 7, fg = "#3f3f3f" })
hi(
  0,
  "VD_VeryDarkGrayOnDarkGray",
  { bg = "#44444a", ctermbg = 0, ctermfg = 7, fg = "#3f3f3f" }
)
hi(0, "VD_VeryLightGray", { ctermbg = 0, ctermfg = 7, fg = "#c3c3c3" })
hi(
  0,
  "VD_VeryLightGrayOnDarkGray",
  { bg = "#44444a", ctermbg = 0, ctermfg = 7, fg = "#c3c3c3" }
)
hi(
  0,
  "VD_VeryLightGrayOnVeryDarkGray",
  { bg = "#3f3f3f", ctermbg = 0, ctermfg = 7, fg = "#c3c3c3" }
)
hi(
  0,
  "VD_VeryLightGrayOnVoid",
  { bg = "#1a1a1a", ctermbg = 0, ctermfg = 7, fg = "#c3c3c3" }
)
hi(0, "VD_White", { ctermbg = 0, ctermfg = 15, fg = "#ffffff" })
hi(
  0,
  "VD_WhiteOnDarkGray",
  { bg = "#44444a", ctermbg = 0, ctermfg = 15, fg = "#ffffff" }
)
hi(
  0,
  "VD_WhiteOnVeryDarkGray",
  { bg = "#3f3f3f", ctermbg = 0, ctermfg = 15, fg = "#ffffff" }
)
hi(
  0,
  "VD_WhiteOnVoid",
  { bg = "#1a1a1a", ctermbg = 0, ctermfg = 15, fg = "#ffffff" }
)
hi(0, "VertSplit", { link = "VD_MediumDarkGray" })
hi(0, "Visual", { bg = "#44444a", ctermbg = 0, ctermfg = 7, fg = "#c0c0ca" })
hi(0, "WildMenu", { link = "VD_WhiteOnDarkGray" })
hi(0, "WinSeparator", { link = "VD_MediumDarkGray" })
hi(0, "diffAdded", { link = "VD_LightGray" })
hi(0, "diffCommon", { link = "VD_LightGray" })
hi(0, "iCursor", { link = "VD_BlackOnWhite" })
hi(0, "lCursor", { bg = "#c0c0ca" })
hi(0, "LineNrAbove", { bg = "none", fg = "#585b70" })
hi(0, "LineNrBelow", { bg = "none", fg = "#585b70" })
hi(0, "LineNr", { bg = "none", fg = "#cdd6f4" })
hi(0, "SignColumn", { bg = "none" })
hi(0, "PmenuSel", { bg = "#313244" })
hi(0, "NormalFloat", { bg = "none" })
hi(0, "FloatBorder", { bg = "none" })
hi(0, "VertSplit", { bg = "none" })
hi(0, "WinSeparator", { bg = "none" })
hi(0, "TabLine", { bg = "none" })
hi(0, "TabLineFill", { bg = "none" })
hi(0, "TabLineSel", { bg = "none" })
hi(0, "DiagnosticDefaultError", { link = "DiagnosticError" })
hi(0, "DiagnosticDefaultHint", { link = "DiagnosticHint" })
hi(0, "DiagnosticDefaultInfo", { link = "DiagnosticInfo" })
hi(0, "DiagnosticDefaultOk", { link = "DiagnosticOk" })
hi(0, "DiagnosticDefaultWarn", { link = "DiagnosticWarn" })
hi(0, "DiagnosticError", { fg = "#585b70" })
hi(0, "DiagnosticHint", { fg = "#585b70" })
hi(0, "DiagnosticInfo", { fg = "#585b70" })
hi(0, "DiagnosticOk", { fg = "#585b70" })
hi(0, "DiagnosticUnderlineError", { sp = "#585b70" })
hi(0, "DiagnosticUnderlineHint", { sp = "#585b70" })
hi(0, "DiagnosticUnderlineInfo", { sp = "#585b70" })
hi(0, "DiagnosticUnderlineOk", { sp = "#585b70" })
hi(0, "DiagnosticUnderlineWarn", { sp = "#585b70" })
hi(0, "DiagnosticVirtualTextError", { fg = "#585b70" })
hi(0, "DiagnosticVirtualTextHint", { fg = "#585b70" })
hi(0, "DiagnosticVirtualTextInfo", { fg = "#585b70" })
hi(0, "DiagnosticVirtualTextOk", { fg = "#585b70" })
hi(0, "DiagnosticVirtualTextWarn", { fg = "#585b70" })
hi(0, "DiagnosticWarn", { fg = "#585b70" })
hi(0, "StatusLine", { fg = "#908caa" })
hi(0, "StatusLineNC", { fg = "#6e6a86" })
-- Terminal colors
local g = vim.g

g.terminal_color_0 = "#26233a"
g.terminal_color_1 = "#eb6f92"
g.terminal_color_2 = "#31748f"
g.terminal_color_3 = "#f6c177"
g.terminal_color_4 = "#9ccfd8"
g.terminal_color_5 = "#c4a7e7"
g.terminal_color_6 = "#ebbcba"
g.terminal_color_7 = "#e0def4"
g.terminal_color_8 = "#908caa"
g.terminal_color_9 = "#eb6f92"
g.terminal_color_10 = "#31748f"
g.terminal_color_11 = "#f6c177"
g.terminal_color_12 = "#9ccfd8"
g.terminal_color_13 = "#c4a7e7"
g.terminal_color_14 = "#ebbcba"
g.terminal_color_15 = "#e0def4"
