return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = true,
	cmd = "Trouble",
	keys = {
		{
			"<leader>xw",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Workplace diagnostics",
		},
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer diagnostics",
		},
		{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", "Loclist" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", "Quickfix" },
	},
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
