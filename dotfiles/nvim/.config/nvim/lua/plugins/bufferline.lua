-- See current buffers at the top of the editor
return {
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			{
				"echasnovski/mini.nvim",
				config = function()
					require("mini.bufremove").setup()
				end,
			},
		},
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
			{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
			{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
			{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		},
		opts = {
			options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				indicator = {
					style = "underline",
				},
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
	},
	{
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
			},
		},
	},
}
