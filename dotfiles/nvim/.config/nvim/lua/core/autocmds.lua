local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"*/ansible/*.yml",
		"*/ansible/*.yml",
		"*/playbooks/*.yml",
		"*/roles/*/handlers/*.yml",
		"*/roles/*/tasks/*.yml",
		"*/ansible/*.yaml",
		"*/playbooks/*.yaml",
		"*/roles/*/handlers/*.yaml",
		"*/roles/*/tasks/*.yaml",
	},
	group = augroup("filetype_ansible"),
	callback = function()
		vim.opt_local.ft = "yaml.ansible"
	end,
})
