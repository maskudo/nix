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
			},
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
