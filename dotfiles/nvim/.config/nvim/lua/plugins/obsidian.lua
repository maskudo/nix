return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = false,
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/zt/notes/",
			},
		},
		notes_subdir = "notes/inbox",

		-- see below for full list of options 👇
	},
	keys = {
		{ "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Note" },
		{ "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find Note" },
		{ "<leader>ot", "<cmd>ObsidianTags<cr>", "Find Tags" },
		{ "<leader>ogd", "<cmd>ObsidianFollowLink<cr>", "Follow Link" },
		{ "<leader>os", "<cmd>ObsidianSearch<cr>", "Search" },
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
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
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
				local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = "", project = "" }

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
				local current_time = os.date("%Y%m%d%H%M")
				-- return tostring(current_time) .. "-" .. suffix
				return suffix
			end,

			templates = {
				subdir = "Templates",
				date_format = "%Y-%m-%d-%a",
				time_format = "%H:%M",
				tags = "",
			},
		})
	end,
}
