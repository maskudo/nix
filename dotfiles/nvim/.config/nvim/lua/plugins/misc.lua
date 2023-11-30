-- Miscelaneous fun stuff
return {
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				lazy = true,
				opts = {
					enable_autocmd = false,
				},
			},
		},
	},
	{
		"echasnovski/mini.pairs",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"kazhala/close-buffers.nvim",
		event = "VeryLazy",
		opts = {
			preserve_window_layout = { "this", "nameless" },
		},
	},
	{ "tpope/vim-surround", event = "VeryLazy" }, -- Surround stuff with the ys-, cs-, ds- commands
}
