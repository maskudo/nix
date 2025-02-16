return {
	"echasnovski/mini.nvim",
	version = false,
	event = "VimEnter",
	config = function()
		require("mini.ai").setup()
		require("mini.doc").setup()
		require("mini.git").setup()
		require("mini.jump").setup()
		require("mini.extra").setup()
		require("mini.pairs").setup()
		require("mini.icons").setup()
		require("mini.icons").mock_nvim_web_devicons()
		require("mini.colors").setup()
		require("mini.surround").setup()
		require("mini.bracketed").setup({
			file = { suffix = "", options = {} },
			treesitter = { suffix = "t", options = {} },
		})
		require("mini.splitjoin").setup()
		require("mini.operators").setup()

		require("plugins.mini.files")
		require("plugins.mini.base16")
		require("plugins.mini.hipatterns")
		require("plugins.mini.clue")
	end,
}
