local gitActions = {
	hidden = true,
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
	hidden = true,
	include = { ".env*" },
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
				["<c-h>"] = {
					"toggle_ignored",
					desc = "Toggle Ignored",
					mode = { "n", "i" },
				},
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

local function scratchByFt()
	local engines = { javascript = "node", python = "python" }
	local win_by_ft = {}
	for lang, engine in pairs(engines) do
		win_by_ft[lang] = {
			keys = {
				["source"] = {
					"<CR>",
					function(self)
						local name = vim.api.nvim_buf_get_name(self.buf)
						local res = vim.system({ engine, name }, { text = false }):wait()
						local previous_win = vim.api.nvim_get_current_win()
						Snacks.win({
							text = res.stdout or res.stderr,
							position = "bottom",
							height = 0.25,
							width = 1,
							keys = {
								["q"] = {
									"close_and_focus",
									desc = "Close and Focus",
									mode = { "n" },
								},
							},
							actions = {
								close_and_focus = function(ctx)
									ctx:close()
									vim.api.nvim_set_current_win(previous_win)
								end,
							},
						})
					end,
					desc = "Source buffer",
					mode = { "n", "x" },
				},
			},
		}
	end
	return win_by_ft
end

return {
	"folke/snacks.nvim",
	-- dir = "~/dev/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module 'snacks'
	---@type snacks.Config
	opts = {
		dashboard = {
			enabled = true,
			preset = {
        -- stylua: ignore
				keys = {
					{icon = " ", key = "f", desc = "Find File", action = "<leader>.",},
					{icon = " ", key = "n", desc = "New File", action = ":ene | startinsert",},
					{icon = " ", key = "g", desc = "Find Text", action = "<leader>/",},
					{icon = " ", key = "r", desc = "Recent Files", action = "<leader>fp",},
					{icon = " ", key = "c", desc = "Config", action = "<leader>fc",},
					{icon = " ", key = "s", desc = "Restore Session", section = "session",},
					{icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil,},
					{icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
		bigfile = { enabled = true },
		zen = {},
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
			win_by_ft = scratchByFt(),
		},
		picker = {
			formatters = {
				file = {
					filename_first = true,
				},
			},
			win = {
				input = {
					keys = {
						["<c-l>"] = {
							"cycle_win",
							desc = "Cycle Window",
							mode = { "n", "i" },
						},
					},
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
								["<space><space>"] = {
									"switch_to_smart",
									desc = "Toggle modified",
									mode = { "n", "i" },
								},
								["<s-m>"] = {
									"toggle_modified",
									desc = "Toggle modified",
									mode = { "n", "i" },
								},
							},
						},
					},
					actions = {
						["switch_to_smart"] = function(picker)
							local current = picker.input:get()
							picker:close()
							Snacks.picker.smart({ pattern = current })
						end,
					},
				},
			},
			layout = {
				preset = "telescope",
			},
		},
		image = {},
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
				height = 0,
				width = 0,
			},
		},
	},
  -- stylua: ignore
	keys = {
		{ "[[", function() require("snacks").words.jump(-1, true) end, desc = "󰉚 Prev reference", },
		{ "]]", function() require("snacks").words.jump(1, true) end, desc = "󰉚 Next reference", },
		{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", },
		{ "gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation", },
		{ "<leader>lr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References", },
		{ "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition", },
		{ "<C-\\>", mode = { "n", "t", "i" }, function() Snacks.terminal.toggle("zsh") end, desc = "Toggle Terminal", },
		{ "<C-g>", function() Snacks.lazygit() end, desc = "Lazygit", },
		{ "<leader>.", function() Snacks.picker.smart({ hidden = true, filter = { cwd = true } }) end, desc = "Find Files", },
		{ "<leader>/", function() Snacks.picker.grep({ hidden = true }) end, desc = "Grep",  },
		{ "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History", },
		{ "<leader><space>", function() Snacks.picker.buffers({ sort_lastused = true, supports_live = true }) end, desc = "Buffers", },
		{ "<leader>ba", function() Snacks.bufdelete.all() end, desc = "Delete All Buffer", },
		{ "<leader>bd", function() Snacks.bufdelete.delete() end, desc = "Delete Current Buffer", },
		{ "<leader>bf", function() Snacks.picker.buffers() end, desc = "List Buffers", },
		{ "<leader>bg", function() Snacks.picker.grep_buffers() end, desc = "Grep Open buffers", },
		{ "<leader>bl", function() Snacks.picker.lines() end, desc = "Buffer Lines", },
		{ "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete Other Buffers", },
		{ "<leader>e", function() Snacks.picker.explorer() end, desc = "Explorer", },
		{ "<leader>fU", function() Snacks.picker.undo() end, desc = "Undo", },
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers", },
		{ "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File", },
		{ "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics", },
		{ "<leader>ff", function() Snacks.picker.files({ hidden = true, filter = { cwd = true } }) end, desc = "Find Files", },
		{ "<leader>fg", function() Snacks.picker.git_files({ hidden = true }) end, desc = "Find Git Files", },
		{ "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps", },
		{ "<leader>fp", function() Snacks.picker.recent({ hidden = true, filter = { cwd = true } }) end, desc = "Recent", },
		{ "<leader>fs", function() Snacks.picker.smart({ hidden = true }) end, desc = "Files (smart)", },
		{ "<leader>gB", function() Snacks.picker.git_branches() end, desc = "Git Branches", },
		{ "<leader>gC", function() Snacks.picker.git_log({ hidden = true, }) end, desc = "Git Commits", },
		{ "<leader>gY", function() Snacks.gitbrowse.open() end, desc = "Open git link in browser", mode = { "n", "v" }, },
		{ "<leader>gc", function() Snacks.picker.git_log_file({ hidden = true, }) end, desc = "Git Commits (file)", },
		{ "<leader>gl", function() Snacks.lazygit() end, desc = "Lazygit", },
		{ "<leader>go", function() Snacks.gitbrowse() end, desc = "Open line(s) in browser", mode = { "n", "v" }, },
		{ "<leader>gy", function() Snacks.gitbrowse.open({ open = function(url) vim.fn.setreg("+", url) vim.notify("Yanked url to clipboard") end, }) end, desc = "Copy line(s) link", mode = { "n", "v" }, },
		{ "<leader>lS", function() Snacks.picker.lsp_workspace_symbols({layout = {preset = "telescope", preview = "main" }, filter = {cwd = true}}) end, desc = "LSP Symbols Workspace", },
		{ "<leader>ld", function() Snacks.picker.diagnostics() end, desc = "Diagnostics", },
		{ "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols", },
		{ "<leader>sc", function() Snacks.picker.commands() end, desc = "Commands", },
		{ "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages", },
		{ "<leader>sP", function() Snacks.picker.projects() end, desc = "Projects", },
		{ "<leader>sR", function() Snacks.picker.registers() end, desc = "Registers", },
		{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages", },
		{ "<leader>ssb", function () Snacks.scratch.open({win = { width = 0.5, height = 0.5 }}) end, desc = "Scratch Buffer", mode = { "n", "v" }, },
		{ "<leader>ssj", function () Snacks.scratch.open({win = { width = 0.5, height = 0.5 ,}, ft="javascript"}) end, desc = "Scratch Buffer JS", mode = { "n", "v" }, },
		{ "<leader>ssp", function () Snacks.scratch.open({win = { width = 0.5, height = 0.5 ,}, ft="python"}) end, desc = "Scratch Buffer Python", mode = { "n", "v" }, },
		{ "<leader>ssl", function ()
      vim.ui.input({prompt="Enter language:"}, function (lang)
        if not lang or #lang == 0 then
          return
        end
        Snacks.scratch.open({win = { width = 0.5, height = 0.5 ,}, ft=lang})
      end)
    end, desc = "Scratch Buffer ft", mode = { "n", "v" }, },
		{ "<leader>sss", function () Snacks.scratch.select({win = { width = 0.5, height = 0.5 }}) end, desc = "List Scratch Buffer", mode = { "n", "v" }, },
		{ "<leader>sm", function() Snacks.picker.marks({filter= {cwd = true}}) end, desc = "Marks", mode = { "n", "v" }, },
		{ "<leader>sp", function() Snacks.picker() end, desc = "Picker", },
		{ "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List", },
		{ "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume", },
		{ "<leader>st", function() Snacks.picker.treesitter() end, desc = "Picker", },
		{ "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" }, },
		{ "<leader>uc", ":TSContextToggle<CR>", desc = "Toggle TS Context", },
		{ "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes", },
		{ "<leader>ud", function() Snacks.toggle.diagnostics():toggle() end, desc = "Toggle Diagnostics", },
		{ "<leader>uh", function() Snacks.toggle.inlay_hints():toggle() end, desc = "Toggle Inlay Hints", },
		{ "<leader>ui", function() Snacks.toggle.indent():toggle() end, desc = "Toggle Indent", },
		{ "<leader>un", function() Snacks.notifier.show_history() end, desc = "Show Notifications", },
		{ "<leader>us", function() Snacks.toggle.scroll():toggle() end, desc = "Toggle Scroll", },
		{ "<leader>ut", function() Snacks.toggle.treesitter():toggle() end, desc = "Toggle Treesitter", },
		{ "<leader>uw", function() Snacks.toggle.option("wrap"):toggle() end, desc = "Toggle Line Wrap", },
	},
}
