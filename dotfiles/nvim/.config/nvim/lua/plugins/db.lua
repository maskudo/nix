return {
	"kristijanhusak/vim-dadbod-ui",
	lazy = true,
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{
			"kristijanhusak/vim-dadbod-completion",
			ft = { "sql", "mysql", "plsql" },
			lazy = true,
		},
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	keys = {
		{ "<leader>Do", "<cmd>tabnew<cr><cmd>DBUI<cr>", desc = "Open DB UI" },
		{ "<leader>Da", "<cmd>DBUIAddConnection<cr>", desc = "Add Connection" },
		{ "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "Find Buffer" },
	},
	init = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_force_echo_notifications = 1
		-- Disable C-j and C-k mappings in vim-dadbod-ui
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "dbui",
			callback = function()
				vim.api.nvim_buf_del_keymap(0, "n", "<C-j>")
				vim.api.nvim_buf_del_keymap(0, "n", "<C-k>")
			end,
		})
	end,
}
