local kind_icons = require("helpers.kind_icons").kind_icons
return {
	{
		"saghen/blink.cmp",
		enabled = false,
		lazy = false,
		dependencies = "rafamadriz/friendly-snippets",
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
			fuzzy = {
				sorts = { "kind", "label", "score" },
			},
			sources = {
				completion = {
					enabled_providers = {
						"dadbod",
						"lsp",
						"path",
						"buffer",
						"snippets",
					},
				},
				providers = {
					snippets = {
						score_offset = -5,
					},
					lsp = {
						score_offset = 8,
					},
					path = {
						score_offset = 1,
					},
					buffer = {
						score_offset = 3,
					},
					dadbod = {
						name = "Dadbod",
						module = "vim_dadbod_completion.blink",
						score_offset = 10,
					},
				},
			},
			windows = {
				documentation = {
					auto_show = true,
					border = "single",
					auto_show_delay_ms = 100,
					update_delay_ms = 50,
				},
				autocomplete = {
					border = "single",
				},
			},
			kind_icons = kind_icons,
		},
		opts_extend = { "sources.completion.enabled_providers" },
	},
}
