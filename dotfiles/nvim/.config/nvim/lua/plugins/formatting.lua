return {
	"stevearc/conform.nvim",
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
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "biome" },
				svelte = { "biome" },
				css = { "biome" },
				html = { "biome" },
				json = { "biome" },
				yaml = { "prettierd" },
				graphql = { "prettierd" },
				liquid = { "prettierd" },
				markdown = { "prettierd" },
				lua = { "stylua" },
				python = { "isort", "black" },
				nix = { "nixfmt" },
				rust = { "rustfmt" },
				go = { "gofumpt" },
				-- sql = { "sql-formatter" },
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
				timeout_ms = 300,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
