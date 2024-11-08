return {
	"stevearc/conform.nvim",
	event = { "BufEnter", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				["sql-formatter"] = {
					command = "sql-formatter",
					args = { "--config", '{"keywordCase" : "upper"}' },
					stdin = true, -- Enable stdin to allow formatting from the buffer directly
				},
			},
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				nix = { "alejandra" },
				rust = { "rustfmt" },
				go = { "gofumpt" },
				sql = { "sql-formatter" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				racket = {
					format = function(bufnr)
						return {
							cmd = "raco",
							args = { "fmt", "-i", vim.api.nvim_buf_get_name(bufnr) },
							stdin = false,
						}
					end,
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
