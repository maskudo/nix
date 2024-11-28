return {
	"williamboman/mason.nvim",
	lazy = true,
	cmd = { "Mason" },
	keys = {
		{ "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" },
	},
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
		ensure_installed = {
			"ansible-language-server",
			"ansible-lint",
			"biome",
			"black", -- python formatter
			"clangd",
			"css-lsp",
			"docker-compose-language-service",
			"dockerfile-language-server",
			"emmet-ls",
			"flake8",
			"gofumpt",
			"gopls",
			"lua-language-server",
			"markdown-oxide",
			"mypy",
			"nilaway",
			"nixpkgs-fmt",
			"prettierd",
			"pyright",
			"ruff",
			"rust-analyzer",
			"shellcheck",
			"shfmt",
			"sql-formatter",
			"stylua", -- lua formatter
			"tailwindcss-language-server",
			"terraform-ls",
			"tflint",
			"vtsls", -- typescript lsp
			-- debuggers
			"delve",
			"js-debug-adapter",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		local mr = require("mason-registry")
		mr:on("package:install:success", function()
			vim.defer_fn(function()
				-- trigger FileType event to possibly load this newly installed LSP server
				require("lazy.core.handler.event").trigger({
					event = "FileType",
					buf = vim.api.nvim_get_current_buf(),
				})
			end, 100)
		end)

		mr.refresh(function()
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end)
	end,
}
