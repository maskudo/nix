local M = {}
M.augroup = function(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

return M
