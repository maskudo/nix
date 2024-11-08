-- Telescope fuzzy finding (all the things)
return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		event = "VeryLazy",
		cmd = { "Telescope" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
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
			-- find and grep
			local send_find_files_to_live_grep = function()
				local files = {}
				local prompt_bufnr = vim.api.nvim_get_current_buf()
				require("telescope.actions.utils").map_entries(
					prompt_bufnr,
					function(entry, _, _)
						table.insert(files, entry[0] or entry[1])
					end
				)
				require("telescope.builtin").live_grep({
					search_dirs = files,
				})
			end
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"%.git/",
						"%.git$",
						"%.stfolder",
						"%.obsidian",
					},
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
					git_files = {
						mappings = {
							n = {
								["<c-f>"] = send_find_files_to_live_grep,
								["<c-r>"] = require("telescope.actions").to_fuzzy_refine,
							},
							i = {
								["<c-f>"] = send_find_files_to_live_grep,
								["<c-r>"] = require("telescope.actions").to_fuzzy_refine,
							},
						},
					},
					find_files = {
						mappings = {
							n = {
								["<c-f>"] = send_find_files_to_live_grep,
								["<c-r>"] = require("telescope.actions").to_fuzzy_refine,
							},
							i = {
								["<c-f>"] = send_find_files_to_live_grep,
								["<c-r>"] = require("telescope.actions").to_fuzzy_refine,
							},
						},
					},
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "git_worktree")
			pcall(require("telescope").load_extension, "undo")

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
			map("n", "<leader><space>", function()
				return require("telescope.builtin").buffers({ sort_mru = true })
			end, "Buffers")
			map("n", "<leader>.", require("telescope.builtin").git_files, "Git Files")
			map("n", "<leader>fp", function()
				require("telescope.builtin").git_files({ cwd = "~/dotfiles/" })
			end, "Dotfiles")
			map("n", "<leader>fz", function()
				require("telescope.builtin").git_files({ cwd = "~/zt/" })
			end, "Zt Files")
			map("n", "<leader>fh", require("telescope.builtin").help_tags, "Help")
			map(
				"n",
				"<leader>fc",
				require("telescope.builtin").git_bcommits,
				"Git Commits(Buffer)"
			)
			map(
				"n",
				"<leader>fC",
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
			map("n", "<leader>u", "<cmd>Telescope undo<CR>", "Undotree")
		end,
	},
}
