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
			local diffView = function()
				-- Open in diffview
				local selected_entry =
					require("telescope.actions.state").get_selected_entry()
				local value = selected_entry.value
				-- close Telescope window properly prior to switching windows
				vim.api.nvim_win_close(0, true)
				vim.cmd("stopinsert")
				vim.schedule(function()
					vim.cmd(("DiffviewOpen %s^!"):format(value))
				end)
			end

			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"%.git/",
						"%.git$",
						"%.stfolder",
						"%.obsidian",
						"%.png",
						"%.jpg",
						"%.jpeg",
						"%.gif",
						"%.pdf",
						"%.zip",
						"%.tar",
						"%.tar.gz",
						"%.exe",
						"%.bin",
						"%.iso",
						"%.o",
						"%.so",
						"%.dylib",
					},
					mappings = {
						n = {
							["d"] = actions.delete_buffer,
						},
					},
				},
				pickers = {
					buffers = {
						path_display = { smart = true },
						sort_mru = true,
					},
					git_commits = {
						mappings = {
							i = {
								["<C-d>"] = diffView,
							},
						},
					},
					git_bcommits = {
						mappings = {
							i = {
								["<C-d>"] = diffView,
							},
						},
					},
					git_files = {
						mappings = {
							n = {
								["<c-g>"] = send_find_files_to_live_grep,
								["<c-r>"] = actions.to_fuzzy_refine,
							},
							i = {
								["<c-g>"] = send_find_files_to_live_grep,
								["<c-r>"] = actions.to_fuzzy_refine,
							},
						},
					},
					find_files = {
						mappings = {
							n = {
								["<c-g>"] = send_find_files_to_live_grep,
								["<c-r>"] = actions.to_fuzzy_refine,
							},
							i = {
								["<c-g>"] = send_find_files_to_live_grep,
								["<c-r>"] = actions.to_fuzzy_refine,
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
			local bin = require("telescope.builtin")

			map("n", "<leader>fr", bin.oldfiles, "Recently opened")
			map("n", "<leader>ff", function()
				return bin.find_files({ hidden = true })
			end, "Files")
			map("n", "<leader>ft", ":Telescope<CR>", "Telescope")
			map("n", "<leader><space>", function()
				return bin.buffers()
			end, "Buffers")
			map("n", "<leader>.", function()
				return bin.find_files({ hidden = true })
			end, "Files")
			map("n", "<leader>fp", function()
				bin.find_files({ cwd = "~/dotfiles/", hidden = true })
			end, "Dotfiles")
			map("n", "<leader>fz", function()
				bin.find_files({ cwd = "~/zt/", hidden = true })
			end, "Zt Files")
			map("n", "<leader>fh", bin.help_tags, "Help")
			map("n", "<leader>fm", bin.man_pages, "Man Pages")
			map("n", "<leader>gc", bin.git_bcommits, "Git Commits(Buffer)")
			map("n", "<leader>gC", bin.git_commits, "Git Commits")
			map("n", "<leader>fg", bin.git_files, "Git Files")
			map("n", "<leader>fs", bin.git_status, "Git Status")
			map("n", "<leader>f/", bin.live_grep, "Grep (Except Hidden)")
			map("n", "<leader>/", function()
				return bin.live_grep({
					additional_args = { "--hidden" },
				})
			end, "Grep")
			map("n", "<leader>fb", function()
				return bin.buffers()
			end, "Buffers")
			map("n", "gb", function()
				return bin.buffers()
			end, "Buffers")
			map("n", "<leader>fd", bin.diagnostics, "Diagnostics")
			map("n", "<leader>fk", bin.keymaps, "Search keymaps")
			map("n", "<leader>cu", "<cmd>Telescope undo<CR>", "Undotree")
			map("n", "<leader>lS", function()
				return bin.lsp_workspace_symbols({
					symbols = { "function", "method" },
				})
			end, "Workspace Functions")
			map("n", "<leader>ls", function()
				return bin.lsp_document_symbols({
					symbols = { "function", "method" },
				})
			end, "Buffer Functions")
		end,
	},
}
