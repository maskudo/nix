-- Miscelaneous fun stuff
return {
	-- Comment with haste
	{
		"numToStr/Comment.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.pairs",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	-- Better buffer closing actions. Available via the buffers helper.
	{
		"kazhala/close-buffers.nvim",
		event = "VeryLazy",
		opts = {
			preserve_window_layout = { "this", "nameless" },
		},
	},
	{ "tpope/vim-surround", event = "VeryLazy" }, -- Surround stuff with the ys-, cs-, ds- commands
}
