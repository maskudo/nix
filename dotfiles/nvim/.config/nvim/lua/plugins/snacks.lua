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
						action = function()
							return require("telescope.builtin").find_files({ hidden = true })
						end,
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
						action = function()
							return require("telescope.builtin").live_grep({
								additional_args = { "--hidden" },
							})
						end,
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
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
		notifier = { enabled = false },
		quickfile = { enabled = true },
		scratch = {
			win = {
				position = "right",
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
		-- indent = {},
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
				Snacks.scratch()
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
			"<leader>sh",
			function()
				Snacks.scratch.open({ ft = "http" })
			end,
			desc = "Select Scratch Buffer",
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
			"<C-g>",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<C-\\>",
			mode = { "n", "t" },
			function()
				Snacks.terminal.toggle("zsh")
			end,
			desc = "Toggle Terminal",
		},
		{
			"]r",
			function()
				require("snacks").words.jump(1, true)
			end,
			desc = "󰉚 Next reference",
		},
		{
			"[r",
			function()
				require("snacks").words.jump(-1, true)
			end,
			desc = "󰉚 Prev reference",
		},
	},
}
