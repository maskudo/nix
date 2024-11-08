return {
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "BufEnter",
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
					rgb_fn = true, -- CSS rgb() and rgba() functions
					hsl_fn = true, -- CSS hsl() and hsla() functions
					css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
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
}
