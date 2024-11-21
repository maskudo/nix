return {
	{
		"stevearc/oil.nvim",
		cmd = {
			"Oil",
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
		},
		opts = {},
	},
}
