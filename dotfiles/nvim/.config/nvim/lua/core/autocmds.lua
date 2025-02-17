local augroup = require("helpers.autocmd").augroup

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "DressingSelect",
    "Jaq",
    "PlenaryTestPopup",
    "fugitive",
    "git",
    "help",
    "lir",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set(
      "n",
      "q",
      "<cmd>close<cr>",
      { buffer = event.buf, silent = true }
    )
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Notify when recording macro
vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    local register = vim.fn.reg_recording()
    if register ~= "" then
      vim.notify("Recording macro: " .. register, vim.log.levels.INFO)
    end
  end,
  desc = "Notify macro start",
})
vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    local register = vim.fn.reg_recording()
    if register ~= "" then
      vim.notify("End recording macro: " .. register, vim.log.levels.INFO)
    end
  end,
  desc = "Notify macro start",
})

-- update marks to last cursor position when switching buffers
vim.api.nvim_create_autocmd("BufLeave", {
  callback = function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0) -- Get current cursor position
    local buf = vim.api.nvim_get_current_buf()
    for mark = 65, 90 do -- ASCII values for 'A' to 'Z'
      local mark_pos = vim.api.nvim_buf_get_mark(buf, string.char(mark))
      if mark_pos[1] > 0 then -- Ensure mark exists
        vim.api.nvim_buf_set_mark(
          buf,
          string.char(mark),
          cursor_pos[1],
          cursor_pos[2],
          {}
        )
      end
    end
  end,
  desc = "Move uppercase marks to cursor position on BufLeave",
})
