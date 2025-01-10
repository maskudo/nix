return {
	{
		"ibhagwan/fzf-lua",
		enabled = false,
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "FzfLua" },
		keys = {
			{
				"<leader>Fr",
				"<cmd>FzfLua oldfiles<CR>",
				desc = "Recently opened",
			},
			{
				"<leader>Ff",
				"<cmd>FzfLua files<CR>",
				desc = "Files",
			},
			{
				"<leader>Ft",
				"<cmd>FzfLua<CR>",
				desc = "FzfLua",
			},
			{
				"<leader>F<space>",
				"<cmd>FzfLua buffers<CR>",
				desc = "Buffers",
			},
			{
				"<leader>F.",
				"<cmd>FzfLua files<CR>",
				desc = "Files",
			},
			{
				"<leader>Fp",
				"<cmd>FzfLua files cwd=~/dotfiles/<CR>",
				desc = "Dotfiles",
			},
			{
				"<leader>Fz",
				"<cmd>FzfLua files cwd=~/zt/<CR>",
				desc = "Zt Files",
			},
			{
				"<leader>Fh",
				"<cmd>FzfLua help_tags<CR>",
				desc = "Help",
			},
			{
				"<leader>Fm",
				"<cmd>FzfLua man_pages<CR>",
				desc = "Man Pages",
			},
			{
				"<leader>Fg",
				"<cmd>FzfLua git_files<CR>",
				desc = "Git Files",
			},
			{
				"<leader>Fs",
				"<cmd>FzfLua git_status<CR>",
				desc = "Git Status",
			},
			{
				"<leader>F/",
				"<cmd>FzfLua live_grep<CR>",
				desc = "Grep",
			},
			{
				"<leader>/",
				"<cmd>FzfLua live_grep<CR>",
				desc = "Grep",
			},
			{
				"<leader>Fb",
				"<cmd>FzfLua buffers<CR>",
				desc = "Buffers",
			},
			{
				"gb",
				"<cmd>FzfLua buffers<CR>",
				desc = "Buffers",
			},
			{
				"<leader>Fd",
				"<cmd>FzfLua diagnostics_document<CR>",
				desc = "Diagnostics",
			},
			{
				"<leader>Fk",
				"<cmd>FzfLua keymaps<CR>",
				desc = "Search keymaps",
			},
			{
				"<leader>FC",
				"<cmd>FzfLua git_commits<CR>",
				desc = "Git Commits",
			},
			{
				"<leader>Fc",
				"<cmd>FzfLua git_bcommits<CR>",
				desc = "Git Commits(Buffer)",
			},
			{
				"<leader>FL",
				"<cmd>FzfLua lsp_workspace_symbols symbols=function,method<CR>",
				desc = "Workspace Functions",
			},
			{
				"<leader>Fl",
				"<cmd>FzfLua lsp_document_symbols symbols=function,method<CR>",
				desc = "Buffer Functions",
			},
		},
		opts = {
			"telescope",
			keymap = {
				fzf = {
					-- use cltr-q to select all items and convert to quickfix list
					["ctrl-q"] = "select-all+accept",
				},
			},
			oldfiles = {
				cwd_only = true,
				stat_file = true,
			},
			grep = {
				rg_glob = true,
			},
		},
	},
}
