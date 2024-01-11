return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		-- event = "VeryLazy",
		cmd = { "Neotree" },
		dependencies = {
			{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
			{ "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
			{ "MunifTanjim/nui.nvim", event = "VeryLazy" },
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				config = function()
					require("window-picker").setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },
								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
					})
				end,
			},
		},
		opts = {
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			window = {
				mappings = {
					["<space>"] = "none",
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		},
		keys = {
			{
				"<leader>e",
				"<Cmd>Neotree toggle<CR>",
				desc = "Toggle filetree",
			},
		},
		config = function()
			-- If you want icons for diagnostic errors, you'll need to define them somewhere:
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

			vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
			-- vim.api.nvim_set_keymap("n", "<leader>e", "<Cmd>Neotree toggle<CR>", { noremap = true, silent = true })
			vim.api.nvim_create_autocmd({ "ExitPre" }, {
				callback = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			})
		end,
	},

	{
		"stevearc/oil.nvim",
		cmd = {
			"Oil",
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
			{ "<C-f>", "<cmd>Oil<cr>", desc = "Open parent directory" },
		},
		opts = {},
		config = function()
			require("oil").setup()
		end,
	},
}
