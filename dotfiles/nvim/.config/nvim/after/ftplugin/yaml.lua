local augroup = require("helpers.autocmd").augroup

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
