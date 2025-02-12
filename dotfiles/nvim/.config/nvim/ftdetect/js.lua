vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"*/work/**client**/*.js",
	},
	callback = function()
		vim.bo.filetype = "javascriptreact"
	end,
})
