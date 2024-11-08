return {
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		event = "BufReadPre",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{
				"<leader>bt",
				function()
					require("barbecue.ui").toggle()
				end,
				desc = "Toggle Barbecue",
			},
		},
		opts = {
			kinds = {
				File = "",
				Module = "",
				Namespace = "",
				Package = "",
				Class = "",
				Method = "m",
				Property = "",
				Field = "",
				Constructor = "",
				Enum = "",
				Interface = "",
				Function = "󰊕",
				Variable = "",
				Constant = "",
				String = "",
				Number = "",
				Boolean = "",
				Array = "",
				Object = "",
				Key = "󰌋",
				Null = "",
				EnumMember = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			},
			show_modified = true,
			lead_custom_section = function()
				-- Get the number of buffers and format it for display
				local buffers = vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 }))
				return " (" .. buffers .. ") "
			end,
		},
	},
}
