return {
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},

	{
		"echasnovski/mini.pairs",
		version = "*",
		event = "BufEnter",
		config = function()
			require("mini.pairs").setup()
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "BufEnter",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		event = "BufEnter",
		config = function()
			require("colorizer").setup({
				filetypes = {
					"*",
					cmp_docs = { always_update = true },
				},
				buftypes = {},
				user_default_options = {
					RGB = true, -- #RGB hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					names = true, -- "Name" codes like Blue or blue
					RRGGBBAA = false, -- #RRGGBBAA hex codes
					AARRGGBB = false, -- 0xAARRGGBB hex codes
					rgb_fn = false, -- CSS rgb() and rgba() functions
					hsl_fn = false, -- CSS hsl() and hsla() functions
					css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
					-- Available modes for `mode`: foreground, background,  virtualtext
					mode = "background", -- Set the display mode.
					-- Available methods are false / true / "normal" / "lsp" / "both"
					-- True is same as normal
					tailwind = true, -- Enable tailwind colors
					-- parsers can contain values used in |user_default_options|
					sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
					virtualtext = "■",
					-- update color values even if buffer is not focused
					-- example use: cmp_menu, cmp_docs
					always_update = true,
				},
			})
		end,
	},

	{
		"barrett-ruth/live-server.nvim",
		build = "pnpm i --global live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
		lazy = true,
	},

	{
		"mbbill/undotree",
		cmd = { "UndotreeToggle" },
		keys = { -- load the plugin only when using it's keybinding:
			{ "<leader>u", "<cmd>UndotreeToggle<cr>" },
		},
	},

	{
		"BartSte/nvim-project-marks",
		lazy = false,
		config = function()
			-- Get the name of the current working directory.
			local function cwd_name()
				return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
			end

			require("projectmarks").setup({
				shadafile = "~/.local/share/nvim/shadas/" .. cwd_name() .. ".shada",
			})
		end,
	},

	{
		"folke/zen-mode.nvim",
		lazy = true,
		cmd = { "ZenMode" },
		keys = { -- load the plugin only when using it's keybinding:
			{ "<leader>zm", "<cmd>ZenMode<cr>", desc = "ZenMode" },
		},
		opts = {
			window = {
				backdrop = 0, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
				-- height and width can be:
				-- * an absolute number of cells when > 1
				-- * a percentage of the width / height of the editor when <= 1
				-- * a function that returns the width or the height
				width = 0.8, -- width of the Zen window
				height = 0.9, -- height of the Zen window
				-- by default, no options are changed for the Zen window
				-- uncomment any of the options below, or add other vim.wo options you want to apply
				options = {
					signcolumn = "no", -- disable signcolumn
					number = false, -- disable number column
					relativenumber = false, -- disable relative numbers
					cursorline = false, -- disable cursorline
					cursorcolumn = false, -- disable cursor column
					-- foldcolumn = "0", -- disable fold column
					-- list = false, -- disable whitespace characters
				},
			},
			plugins = {
				-- disable some global vim options (vim.o...)
				-- comment the lines to not apply the options
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
					-- you may turn on/off statusline in zen mode by setting 'laststatus'
					-- statusline will be shown only if 'laststatus' == 3
					laststatus = 0, -- turn off the statusline in zen mode
				},
				twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
				gitsigns = { enabled = false }, -- disables git signs
				tmux = { enabled = false }, -- disables the tmux statusline
				todo = { enabled = false }, -- if set to "true", todo-comments.nvim highlights will be disabled
				-- this will change the font size on kitty when in zen mode
				-- to make this work, you need to set the following kitty options:
				-- - allow_remote_control socket-only
				-- - listen_on unix:/tmp/kitty
				kitty = {
					enabled = false,
					font = "+4", -- font size increment
				},
			},
		},
	},
}
