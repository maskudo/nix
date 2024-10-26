local M = {}

M.delete_this = function()
	vim.cmd.bdelete()
end
M.delete_all = function()
	vim.cmd("%bd")
end
M.delete_others = function()
	vim.cmd("%bd|e#|bd#")
end

return M
