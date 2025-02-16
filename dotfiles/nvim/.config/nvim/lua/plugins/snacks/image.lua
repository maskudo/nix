return {
	"folke/snacks.nvim",
	---@module 'snacks'
	---@type snacks.Config
	opts = {
		image = {
			markdown = {
				float = false,
				inline = false,
			},
		},
	},
	keys = {
		{
			"<leader>is",
			function()
				Snacks.image.hover()
			end,
			desc = "Show Image",
		},
	},
}
