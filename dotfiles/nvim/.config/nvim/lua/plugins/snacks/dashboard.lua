return {
	"folke/snacks.nvim",
	---@module 'snacks'
	---@type snacks.Config
	opts = {
		dashboard = {
			enabled = true,
			sections = {
				{
					section = "terminal",
					cmd = "fortune -s | cowsay",
					hl = "header",
					padding = 1,
					indent = 8,
				},
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
			preset = {
        -- stylua: ignore
				keys = {
					{icon = " ", key = "f", desc = "Find File", action = "<leader>.",},
					{icon = " ", key = "n", desc = "New File", action = ":ene | startinsert",},
					{icon = " ", key = "g", desc = "Find Text", action = "<leader>/",},
					{icon = " ", key = "r", desc = "Recent Files", action = "<leader>fp",},
					{icon = " ", key = "c", desc = "Config", action = "<leader>fc",},
					{icon = " ", key = "s", desc = "Restore Session", section = "session",},
					{icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil,},
					{icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},
}
