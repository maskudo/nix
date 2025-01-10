return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = {
		"ObsidianNew",
		"ObsidianTags",
	},
	keys = {
		{ "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Note" },
		{ "<leader>oN", "<cmd>ObsidianNewFromTemplate<cr>", desc = "Search" },
		{ "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find Note" },
		{ "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Find Tags" },
		{ "<leader>od", "<cmd>ObsidianFollowLink<cr>", desc = "Follow Link" },
		{ "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search" },
		{ "<leader>o/", "<cmd>ObsidianSearch<cr>", desc = "Search" },
		{ "<leader>oD", "<cmd>ObsidianDailies<cr>", desc = "Dailies" },
		{ "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Paste Image" },
		{
			"<leader>ox",
			"<cmd>ObsidianToggleCheckbox<cr>",
			desc = "Toggle Checkbox",
		},
	},
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "Notes",
					path = "~/zt/notes",
				},
			},
			notes_subdir = "inbox",
			daily_notes = {
				folder = "dailies",
			},
			-- completion = {
			-- 	nvim_cmp = true,
			-- 	min_chars = 2,
			-- },
			new_notes_location = "notes_subdir",
			wiki_link_func = function(opts)
				if opts.id == nil then
					return string.format("[[%s]]", opts.label)
				elseif opts.label ~= opts.id then
					return string.format("[[%s|%s]]", opts.id, opts.label)
				else
					return string.format("[[%s]]", opts.id)
				end
			end,

			note_frontmatter_func = function(note)
				-- This is equivalent to the default frontmatter function.
				local date_format = "%Y-%m-%d-%a-%H:%M"
				local current_date = os.date(date_format)
				local out = { id = note.id, tags = note.tags, date = current_date }

				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end
				return out
			end,

			note_id_func = function(title)
				-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
				-- In this case a note with the title 'My new note' will be given an ID that looks
				-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				-- local current_time = os.date("%Y%m%d%H%M")
				-- return tostring(current_time) .. "-" .. suffix
				return suffix
			end,
			ui = {
				enable = false, -- set to false to disable all additional syntax features
				update_debounce = 200, -- update delay after a text change (in milliseconds)
				max_file_length = 5000, -- disable UI features for files with more than this many lines
				-- Define how various check-boxes are displayed
				checkboxes = {
					-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
					[" "] = { char = "󰄱 ", hl_group = "ObsidianTodo" },
					["x"] = { char = " ", hl_group = "ObsidianDone" },
					-- [">"] = { char = "", hl_group = "ObsidianRightArrow" },
					-- ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
					-- ["!"] = { char = "", hl_group = "ObsidianImportant" },
					-- Replace the above with this if you don't have a patched font:
					-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
					-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

					-- You can also add more custom ones...
				},
				-- Use bullet marks for non-checkbox lists.
				bullets = { char = "•", hl_group = "ObsidianBullet" },
				external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
				-- Replace the above with this if you don't have a patched font:
				-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
				reference_text = { hl_group = "ObsidianRefText" },
				highlight_text = { hl_group = "ObsidianHighlightText" },
				tags = { hl_group = "ObsidianTag" },
				block_ids = { hl_group = "ObsidianBlockID" },
				hl_groups = {
					-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
					ObsidianTodo = { bold = true, fg = "#f78c6c" },
					ObsidianDone = { bold = true, fg = "#89ddff" },
					ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
					ObsidianTilde = { bold = true, fg = "#ff5370" },
					ObsidianImportant = { bold = true, fg = "#d73128" },
					ObsidianBullet = { bold = true, fg = "#89ddff" },
					ObsidianRefText = { underline = true, fg = "#c792ea" },
					ObsidianExtLinkIcon = { fg = "#c792ea" },
					ObsidianTag = { italic = true, fg = "#89ddff" },
					ObsidianBlockID = { italic = true, fg = "#89ddff" },
					ObsidianHighlightText = { bg = "#75662e" },
				},
			},

			templates = {
				subdir = "Templates",
				date_format = "%Y-%m-%d-%a",
				time_format = "%H:%M",
				tags = "",
			},
		})
	end,
}
