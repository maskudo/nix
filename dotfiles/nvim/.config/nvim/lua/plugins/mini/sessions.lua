local file = ".git/"
	.. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	.. "session.vim"

require("mini.sessions").setup({
	autowrite = true,
	file = file,
	dir = vim.fn.stdpath("state"),
})

local session = require("mini.sessions")

local map = vim.keymap.set
map(
	"n",
	"<leader>qs",
	[[<cmd>lua =vim.v.this_session<cr>]],
	{ desc = "Show Session" }
)
map("n", "<leader>ql", function()
	session.select()
end, { desc = "Select session" })
map("n", "<leader>qc", function()
	session.write(file)
end, { desc = "Write session" })

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("mini-session", { clear = true }),
	callback = function()
		local info = vim.uv.fs_stat(vim.fn.getcwd() .. "/" .. file)
		if not info then
			session.write(file)
		end
	end,
})
