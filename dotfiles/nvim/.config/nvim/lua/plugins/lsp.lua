return {

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			vim.g.lsp_zero_extend_lspconfig = 0
			local lsp_zero = require("lsp-zero")
			lsp_zero.set_sign_icons({
				error = "✘",
				warn = "▲",
				hint = "⚑",
				info = "»",
			})
			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)
			require("mason").setup({})
			require("mason-lspconfig").setup({
				handlers = {
					lsp_zero.default_setup,
				},
			})
		end,
	},
}
