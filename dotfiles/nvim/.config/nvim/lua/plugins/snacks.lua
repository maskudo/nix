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
						action = "<leader>fr",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = "<leader>fp",
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
		words = {
			enabled = true,
			notify_jump = false,
			modes = { "n" },
			debounce = 100,
		},
		indent = {
			enabled = false,
			only_scope = true,
			only_current = true,
			scope = {
				enabled = false,
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
	config = function(_, opts)
		require("snacks").setup(opts)
		-- Create some toggle mappings
		Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
		Snacks.toggle.diagnostics():map("<leader>ud")
		Snacks.toggle
			.option(
				"conceallevel",
				{ off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }
			)
			:map("<leader>uc")
		Snacks.toggle.treesitter():map("<leader>ut")
		Snacks.toggle.inlay_hints():map("<leader>uh")
		Snacks.toggle.indent():map("<leader>ui")
		Snacks.toggle.dim():map("<leader>ud")
		Snacks.toggle.scroll():map("<leader>us")

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
	end,
	keys = {
		{
			"<leader>sb",
			function()
				Snacks.scratch({
					position = "float",
				})
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>ss",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>sr",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<leader>sn",
			function()
				vim.ui.input({
					prompt = "Enter filetype for the scratch buffer: ",
					default = "markdown",
					completion = "filetype",
				}, function(ft)
					Snacks.scratch.open({
						ft = ft,
						name = os.date("%Y-%m-%d-%H-%M-%S"),
						win = {
							width = 150,
							position = "float",
							height = 40,
							border = "single",
							title = "Scratch Buffer",
						},
					})
				end)
			end,
			desc = "Scratch Buffer",
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
	},
}
