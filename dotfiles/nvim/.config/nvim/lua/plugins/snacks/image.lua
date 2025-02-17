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
			resolve = function(img, src)
				if vim.startswith(src, "assets/") then
					return Snacks.git.get_root(img) .. "/notes/" .. src
				end
				return src
			end,
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
