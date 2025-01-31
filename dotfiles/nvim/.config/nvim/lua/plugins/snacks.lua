local gitActions = {
	actions = {
		["open_file"] = function(picker)
			local currentCommit = picker:current().commit
			picker:close()
			vim.cmd("Gitsigns show " .. currentCommit)
		end,
		["diffview"] = function(picker)
			local currentCommit = picker:current().commit
			picker:close()
			vim.cmd("DiffviewOpen HEAD " .. currentCommit)
		end,
	},
	win = {
		input = {
			keys = {
				["<CR>"] = {
					"open_file",
					desc = "Open File",
					mode = { "n", "i" },
				},
				["<c-d>"] = {
					"diffview",
					desc = "Diffview",
					mode = { "n", "i" },
				},
			},
		},
	},
}

local fileActions = {
	actions = {
		["send_to_grep"] = function(picker)
			local current = picker.input:get()
			picker:close()
			Snacks.picker.grep({
				glob = "*" .. current .. "*",
				hidden = true,
				title = "Glob: " .. current,
			})
		end,
	},
	win = {
		input = {
			keys = {
				["<c-r>"] = {
					"send_to_grep",
					desc = "Send to Grep",
					mode = { "n", "i" },
				},
			},
		},
	},
}

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		local term_title = vim.b.term_title
		if term_title and term_title:match("lazygit") then
			-- Create lazygit specific mappings
			vim.keymap.set("t", "<C-g>", "<cmd>close<cr>", { buffer = true })
			vim.keymap.set("t", "<leader>gl", "<cmd>close<cr>", { buffer = true })
		end
	end,
})

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module 'snacks'
	---@type snacks.Config
	opts = {
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{
						icon = " ",
						key = "f",
						desc = "Find File",
						action = "<leader>.",
					},
					{
						icon = " ",
						key = "n",
						desc = "New File",
						action = ":ene | startinsert",
					},
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = "<leader>/",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = "<leader>fp",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = "<leader>fc",
					},
					{
						icon = " ",
						key = "s",
						desc = "Restore Session",
						section = "session",
					},
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scratch = {
			win = {
				position = "float",
				border = "single",
				height = 1,
				width = 0.3,
			},
		},
		picker = {
			formatters = {
				file = {
					filename_first = true,
				},
			},
			sources = {
				git_log_file = gitActions,
				git_log = gitActions,
				files = fileActions,
				smart = fileActions,
				buffers = {
					win = {
						input = {
							keys = {
								["<s-m>"] = {
									"toggle_modified",
									desc = "Toggle modified",
									mode = { "n", "i" },
								},
							},
						},
					},
				},
			},
			layout = {
				reverse = true,
				cycle = true,
				preset = "telescope",
			},
		},
		words = {
			enabled = true,
			notify_jump = false,
			modes = { "n" },
			debounce = 100,
		},
		indent = {
			enabled = false,
			only_scope = true,
			only_current = false,
			scope = {
				enabled = true,
				underline = false,
			},
		},
		input = {},
		terminal = {
			enabled = true,
			win = {
				position = "float",
				border = "single",
				height = 0.7,
				width = 0.7,
			},
		},
		gitbrowse = { enabled = true },
		lazygit = {
			enabled = true,
			win = {
				position = "float",
				border = "single",
				height = 0.9,
				width = 0.9,
			},
		},
	},
	keys = {
		{
			"<leader>uw",
			function()
				Snacks.toggle.option("wrap"):toggle()
			end,
			desc = "Toggle Line Wrap",
		},
		{
			"<leader>ud",
			function()
				Snacks.toggle.diagnostics():toggle()
			end,
			desc = "Toggle Diagnostics",
		},
		{
			"<leader>ui",
			function()
				Snacks.toggle.indent():toggle()
			end,
			desc = "Toggle Indent",
		},
		{
			"<leader>us",
			function()
				Snacks.toggle.scroll():toggle()
			end,
			desc = "Toggle Scroll",
		},
		{
			"<leader>uh",
			function()
				Snacks.toggle.inlay_hints():toggle()
			end,
			desc = "Toggle Inlay Hints",
		},
		{
			"<leader>ut",
			function()
				Snacks.toggle.treesitter():toggle()
			end,
			desc = "Toggle Treesitter",
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gi",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gt",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Show Notifications",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>go",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Open line(s) in browser",
			mode = { "n", "v" },
		},
		{
			"<leader>gY",
			function()
				Snacks.gitbrowse.open()
			end,
			desc = "Open git link in browser",
			mode = { "n", "v" },
		},
		{
			"<leader>gy",
			function()
				Snacks.gitbrowse.open({
					open = function(url)
						vim.fn.setreg("+", url)
						vim.notify("Yanked url to clipboard")
					end,
				})
			end,
			desc = "Copy line(s) link",
			mode = { "n", "v" },
		},
		{
			"<C-g>",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<C-\\>",
			mode = { "n", "t", "i" },
			function()
				Snacks.terminal.toggle("zsh")
			end,
			desc = "Toggle Terminal",
		},
		{
			"]]",
			function()
				require("snacks").words.jump(1, true)
			end,
			desc = "󰉚 Next reference",
		},
		{
			"[[",
			function()
				require("snacks").words.jump(-1, true)
			end,
			desc = "󰉚 Prev reference",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete.delete()
			end,
			desc = "Delete Current Buffer",
		},
		{
			"<leader>bo",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Delete Other Buffers",
		},
		{
			"<leader>ba",
			function()
				Snacks.bufdelete.all()
			end,
			desc = "Delete All Buffer",
		},
		{
			"<leader>bf",
			function()
				Snacks.picker.buffers()
			end,
			desc = "List Buffers",
		},
		{
			"<leader>bg",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open buffers",
		},
		{
			"<leader>bl",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>bw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		{
			"<leader><space>",
			function()
				Snacks.picker.buffers({ sort_lastused = true, supports_live = true })
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep({ hidden = true })
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>.",
			function()
				Snacks.picker.smart({ hidden = true })
			end,
			desc = "Find Files",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files({ hidden = true, filter = { cwd = true } })
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files({ hidden = true })
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.recent({ hidden = true, filter = { cwd = true } })
			end,
			desc = "Recent",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.smart({ hidden = true })
			end,
			desc = "Files (smart)",
		},
		{
			"<leader>fR",
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>ld",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>fq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>fP",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>uC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		{
			"<leader>ft",
			function()
				Snacks.picker()
			end,
			desc = "Picker",
		},
		{
			"<leader>gC",
			function()
				Snacks.picker.git_log({
					hidden = true,
				})
			end,
			desc = "Git Commits",
		},
		{
			"<leader>gc",
			function()
				Snacks.picker.git_log_file({
					hidden = true,
				})
			end,
			desc = "Git Commits (file)",
		},
		{
			"<leader>gB",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>ls",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>fU",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>fD",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
	},
}
