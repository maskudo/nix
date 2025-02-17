require("mini.files").setup({
  mappings = {
    close = "q",
    go_in = "<S-CR>",
    go_in_plus = "<CR>",
    go_out = "-",
    synchronize = ":w<CR>",
  },
  windows = {
    width_focus = 30,
    width_preview = 80,
  },
  options = {
    use_as_default_explorer = true,
  },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    vim.keymap.set("n", "<C-c>", function()
      MiniFiles.close()
    end, { buffer = args.data.buf_id, desc = "Close" })
    vim.keymap.set("n", "<C-h>", function()
      MiniFiles.config.windows.preview = not MiniFiles.config.windows.preview
    end, { buffer = args.data.buf_id, desc = "Close" })
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    require("snacks").rename.on_rename_file(event.data.from, event.data.to)
  end,
})

-- Open the directory of the file currently being edited
-- If the file doesn't exist because you maybe switched to a new git branch
-- open the current working directory
vim.keymap.set("n", "-", function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local dir_name = vim.fn.fnamemodify(buf_name, ":p:h")
  if vim.fn.filereadable(buf_name) == 1 then
    -- Pass the full file path to highlight the file
    require("mini.files").open(buf_name, true)
  elseif vim.fn.isdirectory(dir_name) == 1 then
    -- If the directory exists but the file doesn't, open the directory
    require("mini.files").open(dir_name, true)
  else
    -- If neither exists, fallback to the current working directory
    require("mini.files").open(vim.uv.cwd(), true)
  end
end)

vim.keymap.set("n", "_", function()
  require("mini.files").open()
end, { desc = "Open mini.files (CWD)" })
