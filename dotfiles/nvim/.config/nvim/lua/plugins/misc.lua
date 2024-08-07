return {
	{
		"echasnovski/mini.comment",
		event = "BufEnter",
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				lazy = true,
				event = "BufEnter",
				opts = {
					enable_autocmd = false,
				},
			},
		},
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
		"kazhala/close-buffers.nvim",
		event = "VeryLazy",
		opts = {
			preserve_window_layout = { "this", "nameless" },
		},
	},

	{ "tpope/vim-surround", event = "VeryLazy" }, -- Surround stuff with the ys-, cs-, ds- commands

	{
		"NvChad/nvim-colorizer.lua",
		event = "VeryLazy",
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
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{
		"barrett-ruth/live-server.nvim",
		build = "pnpm i --global live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
		lazy = true,
	},
	{
		"maskudo/bharyang.nvim",
		cmd = { "BharyangAsc", "BharyangDesc", "BharyangGroupDesc", "BharyangGroupAsc" },
		lazy = true,
		config = function()
			require("bharyang").setup()
		end,
	},
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("undotree").setup()
		end,
		keys = { -- load the plugin only when using it's keybinding:
			{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},
}
