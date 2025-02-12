return {
	{
		dir = "~/dev/lua/devdocs.nvim",
		dependencies = {
			"folke/snacks.nvim",
		},
		opts = {
			ensure_installed = {
				"go",
				"html",
			},
		},
	},

	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "BufEnter",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},
	{
		"barrett-ruth/live-server.nvim",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
		lazy = true,
	},

	{
		"BartSte/nvim-project-marks",
		lazy = false,
		config = function()
			-- Get the name of the current working directory.
			local function cwd_name()
				return vim.fn.fnamemodify(
					require("snacks").git.get_root() or vim.fn.getcwd(),
					":t"
				)
			end
			vim.fn.mkdir(vim.fn.stdpath("data") .. "/shadas", "p")
			local path = vim.fn.stdpath("data")
				.. "/shadas/"
				.. cwd_name()
				.. ".shada"
			require("projectmarks").setup({
				shadafile = path,
			})
			local shadaExists = vim.uv.fs_stat(path)
			if shadaExists == nil then
				require("projectmarks").make_shada(path)
			end
		end,
	},
	{
		"MagicDuck/grug-far.nvim",
		lazy = true,
		cmd = { "GrugFar" },
		opts = {},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {
			modes = {
				char = {
					enabled = false, -- Disable character motions (like `f`, `t`, `F`, `T`)
				},
				search = {
					enabled = false, -- Disable search motions (`/`, `?`)
				},
			},
		},
    -- stylua: ignore
    keys = {
      { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
	},
}
