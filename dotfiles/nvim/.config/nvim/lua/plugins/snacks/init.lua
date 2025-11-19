local enable_virtual_lines = false
return {
  "folke/snacks.nvim",
  -- dir = "~/dev/snacks.nvim",
  priority = 1000,
  lazy = false,
  import = "plugins.snacks",
  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    zen = {},
    bufdelete = { enabled = true },
    scroll = {
      animate = {
        duration = { step = 10, total = 50 },
        easing = "linear",
      },
      animate_repeat = {
        delay = 200, -- delay in ms before using the repeat animation
        duration = { step = 5, total = 50 },
        easing = "linear",
      },
    },
    statuscolumn = {
      enabled = true,
      left = {
        "git",
      },
      right = { "mark", "fold" },
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    words = {
      enabled = true,
      notify_jump = false,
      modes = { "n" },
      debounce = 100,
    },
    input = {},
    gitbrowse = { enabled = true },
    explorer = {},
    picker = {
      sources = {
        explorer = {
          hidden = true,
          layout = {
            -- layout = { position = "right" },
          },
        },
      },
    },
  },
  -- stylua: ignore
	keys = {
		{ "[[", function() Snacks.words.jump(-1, true) end, desc = "󰉚 Prev reference", },
		{ "]]", function() Snacks.words.jump(1, true) end, desc = "󰉚 Next reference", },
		{"<leader>ba", function() Snacks.bufdelete.all() end, desc = "Delete All Buffer",},
		{"<leader>bd", function() Snacks.bufdelete.delete() end, desc = "Delete Current Buffer",},
		-- { "<leader>uc", ":TSContextToggle<CR>", desc = "Toggle TS Context", },
		{ "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes", },
		{ "<leader>uDd", function() Snacks.toggle.diagnostics():toggle() end, desc = "Toggle Diagnostics", },
		{ "<leader>uDl", function()
      enable_virtual_lines = not enable_virtual_lines
      vim.diagnostic.config({virtual_lines = enable_virtual_lines, virtual_text = not enable_virtual_lines})
    end, desc = "Toggle Line Diagnostics", },
		{ "<leader>uh", function() Snacks.toggle.inlay_hints():toggle() end, desc = "Toggle Inlay Hints", },
		{ "<leader>ui", function() Snacks.toggle.indent():toggle() end, desc = "Toggle Indent", },
		{ "<leader>un", function() Snacks.notifier.show_history() end, desc = "Show Notifications", },
		{ "<leader>us", function() Snacks.toggle.scroll():toggle() end, desc = "Toggle Scroll", },
		{ "<leader>ut", function() Snacks.toggle.treesitter():toggle() end, desc = "Toggle Treesitter", },
		{ "<leader>uw", function() Snacks.toggle.option("wrap"):toggle() end, desc = "Toggle Line Wrap", },
		{ "<leader>uz", function() Snacks.zen() end, desc = "Toggle Zen", },
  }
,
}
