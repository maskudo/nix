return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		lazy = true,
		opts = {
			icons = {
				mappings = false,
			},
			spec = {
				{
					mode = { "n", "v" },
					{ "<leader>g", group = "Git" },
					{ "<leader>f", group = "File" },
					{ "<leader>D", group = "Database" },
					{ "<leader>d", group = "Debugger" },
					{ "<leader>b", group = "Buffer" },
					{ "<leader>l", group = "LSP" },
					{ "<leader>q", group = "Quit" },
					{ "<leader>s", group = "Search" },
					{ "<leader>c", group = "Code" },
					{ "<leader>u", group = "UI" },
					{ "<leader>g", group = "Git" },
					{ "<leader>x", group = "Diagnostics" },
					{ "<leader>y", group = "Yank" },
					{ "<leader>t", group = "Tab" },
				},
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
