-- Telescope fuzzy finding (all the things)
return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = vim.fn.executable("make") == 1,
				event = "VeryLazy",
			},
		},
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "./.git/", ".git" },
					mappings = {
						n = {
							["<C-d>"] = actions.delete_buffer,
						},
						i = {
							["<C-d>"] = actions.delete_buffer,
						},
					},
				},
				pickers = {
					buffers = {
						path_display = { smart = true },
					},
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "git_worktree")

			local map = require("helpers.keys").map
			map(
				"n",
				"<leader>fr",
				require("telescope.builtin").oldfiles,
				"Recently opened"
			)
			map("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require("telescope.builtin").current_buffer_fuzzy_find(
					require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					})
				)
			end, "Search in current buffer")

			map("n", "<leader>ff", function()
				return require("telescope.builtin").find_files({ hidden = true })
			end, "Files")
			map(
				"n",
				"<leader><space>",
				require("telescope.builtin").buffers,
				"Buffers"
			)
			map("n", "<leader>.", require("telescope.builtin").git_files, "Git Files")
			map("n", "<leader>fh", require("telescope.builtin").help_tags, "Help")
			map(
				"n",
				"<leader>fc",
				require("telescope.builtin").git_commits,
				"Git Commits"
			)
			map(
				"n",
				"<leader>fg",
				require("telescope.builtin").git_files,
				"Git Files"
			)
			map(
				"n",
				"<leader>fs",
				require("telescope.builtin").git_status,
				"Git Status"
			)
			map(
				"n",
				"<leader>f/",
				require("telescope.builtin").live_grep,
				"Grep (Except Hidden)"
			)
			map("n", "<leader>/", function()
				return require("telescope.builtin").live_grep({
					additional_args = { "--hidden" },
				})
			end, "Grep")
			map("n", "<leader>fb", function()
				return require("telescope.builtin").buffers({ sort_mru = true })
			end, "Buffers")
			map("n", "gb", function()
				return require("telescope.builtin").buffers({ sort_mru = true })
			end, "Buffers")
			map("n", "=", function()
				return require("telescope.builtin").buffers({ sort_mru = true })
			end, "Buffers")
			map(
				"n",
				"<leader>fd",
				require("telescope.builtin").diagnostics,
				"Diagnostics"
			)
			map(
				"n",
				"<leader>fk",
				require("telescope.builtin").keymaps,
				"Search keymaps"
			)
		end,
	},
}
