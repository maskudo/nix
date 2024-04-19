return {

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		event = "VeryLazy",
		dependencies = {
			{
				"folke/neodev.nvim",
				opts = {},
				event = "VeryLazy",
				config = function()
					require("neodev").setup({})
				end,
			},
			{ "neovim/nvim-lspconfig", event = "VeryLazy" },
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"williamboman/mason.nvim",
			{ "williamboman/mason-lspconfig.nvim", event = "VeryLazy" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			-- lsp_zero.preset("recommended")
			lsp_zero.extend_lspconfig()

			lsp_zero.set_sign_icons({
				error = "✘",
				warn = "▲",
				hint = "⚑",
				info = "»",
			})
			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({
					buffer = bufnr,
					preserve_mappings = false,
				})
				-- lsp_zero.async_autoformat(client, bufnr)
				local code_Action = function()
					vim.lsp.buf.code_action({
						context = {
							only = {
								"source",
							},
							diagnostics = {},
						},
					})
				end
				vim.keymap.set(
					"n",
					"<Leader>ca",
					"<cmd>lua vim.lsp.buf.code_action()<cr>",
					{ buffer = bufnr, desc = "Code action line" }
				)
				vim.keymap.set(
					"n",
					"<Leader>cA",
					code_Action,
					{ buffer = bufnr, silent = true, desc = "Code action document" }
				)
				vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr, desc = "Lsp Rename" })
				vim.keymap.set(
					"i",
					"<C-k>",
					"<cmd>lua vim.lsp.buf.signature_help()<cr>",
					{ buffer = bufnr, desc = "Signature Help" }
				)
			end)
			require("mason").setup()
			require("mason-lspconfig").setup({
				handlers = {
					lsp_zero.default_setup,
				},
			})
		end,
	},
}
