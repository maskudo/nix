return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	lazy = true,
	cmd = { "Mason" },
	-- event = "VeryLazy",
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ansiblels",
				"clangd",
				"cssls",
				"dockerls",
				"docker_compose_language_service",
				"emmet_ls",
				"eslint",
				"gopls",
				"lua_ls",
				"markdown_oxide",
				"pyright",
				"rust_analyzer",
				"tailwindcss",
				"ts_ls",
				"terraformls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- "ansible-lint",
				"black", -- python formatter
				"flake8",
				"gofumpt",
				"mypy",
				"prettier",
				"pylint",
				"pyright",
				"ruff",
				"shellcheck",
				"nixpkgs-fmt",
				"sql-formatter",
				"nilaway",
				"shfmt",
				"stylua", -- lua formatter
				"tflint",
				-- debuggers
				"js-debug-adapter",
				"delve",
			},
		})
		vim.keymap.set("n", "<leader>M", ":Mason<CR>", { desc = "Mason" })
	end,
}
