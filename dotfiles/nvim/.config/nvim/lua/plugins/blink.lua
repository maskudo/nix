return {
	{
		"saghen/blink.cmp",
		enabled = true,
		lazy = false,
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		---
		opts = {
			keymap = {
				preset = "default",
				["<C-j>"] = { "scroll_documentation_down" },
				["<C-k>"] = { "scroll_documentation_up" },
				cmdline = {
					preset = "default",
					["<Tab>"] = { "select_next", "select_and_accept" },
					["<S-Tab>"] = { "select_prev", "select_and_accept" },
				},
			},
			completion = {
				menu = { border = "single" },
				documentation = { window = { border = "single" } },
				list = {
					selection = {
						preselect = function(ctx)
							return ctx.mode ~= "cmdline"
						end,
					},
				},
			},
			signature = { window = { border = "single" } },
			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
					"dadbod",
				},
				providers = {
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
				},
			},
		},
		opts_extend = { "sources.completion.enabled_providers" },
	},
}
