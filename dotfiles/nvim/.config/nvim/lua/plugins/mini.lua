return {
	"echasnovski/mini.nvim",
	version = false,
	event = "VimEnter",
	keys = {
		-- Open the directory of the file currently being edited
		-- If the file doesn't exist because you maybe switched to a new git branch
		-- open the current working directory
		{
			"-",
			function()
				local buf_name = vim.api.nvim_buf_get_name(0)
				local dir_name = vim.fn.fnamemodify(buf_name, ":p:h")
				if vim.fn.filereadable(buf_name) == 1 then
					-- Pass the full file path to highlight the file
					require("mini.files").open(buf_name, true)
				elseif vim.fn.isdirectory(dir_name) == 1 then
					-- If the directory exists but the file doesn't, open the directory
					require("mini.files").open(dir_name, true)
				else
					-- If neither exists, fallback to the current working directory
					require("mini.files").open(vim.uv.cwd(), true)
				end
			end,
			desc = "Open mini.files (Directory of Current File or CWD if not exists)",
		},
		{
			"_",
			function()
				require("mini.files").open()
			end,
			desc = "Open mini.files (CWD)",
		},
	},
	config = function()
		require("mini.ai").setup()
		require("mini.git").setup()
		require("mini.jump").setup()
		require("mini.pairs").setup()
		require("mini.icons").setup()
		require("mini.basics").setup()
		require("mini.colors").setup()
		require("mini.surround").setup()
		require("mini.splitjoin").setup()
		require("mini.operators").setup()
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {

				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = {
					pattern = "%f[%w]()FIXME()%f[%W]",
					group = "MiniHipatternsFixme",
				},
				hack = {
					pattern = "%f[%w]()HACK()%f[%W]",
					group = "MiniHipatternsHack",
				},
				todo = {
					pattern = "%f[%w]()TODO()%f[%W]",
					group = "MiniHipatternsTodo",
				},
				note = {
					pattern = "%f[%w]()NOTE()%f[%W]",
					group = "MiniHipatternsNote",
				},

				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = hipatterns.gen_highlighter.hex_color(),
				tailwind = {
					pattern = "%f[%w:-]()[%w:-]+%-[a-z%-]+%-%d+()%f[^%w:-]",
					group = function(_, _, m)
						---@type string
						local match = m.full_match
						local M = require("helpers.tailwind_colors")
						---@type string, number
						local color, shade = match:match("[%w-]+%-([a-z%-]+)%-(%d+)")
						shade = tonumber(shade)
						local bg = vim.tbl_get(M.colors, color, shade)
						if bg then
							local hl = "MiniHipatternsTailwind" .. color .. shade
							if not M.hl[hl] then
								M.hl[hl] = true
								local bg_shade = shade == 500 and 950
									or shade < 500 and 900
									or 100
								local fg = vim.tbl_get(M.colors, color, bg_shade)
								vim.api.nvim_set_hl(0, hl, { bg = "#" .. bg, fg = "#" .. fg })
							end
							return hl
						end
					end,
					extmark_opts = { priority = 2000 },
				},
			},
		})
		require("mini.files").setup({
			mappings = {
				close = "q",
				go_in = "<S-CR>",
				go_in_plus = "<CR>",
				go_out = "-",
				synchronize = ":w<CR>",
			},
			windows = {
				width_focus = 30,
				width_preview = 80,
			},
			options = {
				use_as_default_explorer = true,
			},
		})
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				vim.keymap.set("n", "<C-c>", function()
					MiniFiles.close()
				end, { buffer = args.data.buf_id, desc = "Close" })
				vim.keymap.set("n", "<C-h>", function()
					MiniFiles.config.windows.preview =
						not MiniFiles.config.windows.preview
				end, { buffer = args.data.buf_id, desc = "Close" })
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesActionRename",
			callback = function(event)
				require("snacks").rename.on_rename_file(event.data.from, event.data.to)
			end,
		})
	end,
}
