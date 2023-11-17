return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	event = "VeryLazy",
	keys = { { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
			"stylua",
			"shellcheck",
			"shfmt",
			"flake8",
			"prettierd",
			"eslint_d",
			"rust-analyzer",
			"typescript-language-server",
			"tailwindcss-language-server",
			"gopls",
			"emmet-ls",
			"css-lsp",
			"dockerfile-language-server",
			"docker-compose-language-service",
			"clangd",
			"ansible-language-server",
			"ansible-lint",
			"mypy",
			"ruff",
			"pyright",
			"black",
		},
	},
	---@param opts MasonSettings | {ensure_installed: string[]}
	config = function(_, opts)
		require("lsp-zero").extend_lspconfig()
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
		local function ensure_installed()
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end
		if mr.refresh then
			mr.refresh(ensure_installed)
		else
			ensure_installed()
		end
	end,
}
