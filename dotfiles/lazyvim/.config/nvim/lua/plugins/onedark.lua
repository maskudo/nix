return {
  "navarasu/onedark.nvim",
  config = function()
    require("onedark").setup({
      style = "deep",
      transparent = true, -- Show/hide background    transparent = false,  -- Show/hide background
    })
  end,
}
