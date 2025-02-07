vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"*/work/**/*.js",
	},
	callback = function()
		vim.bo.filetype = "javascriptreact"
	end,
})
