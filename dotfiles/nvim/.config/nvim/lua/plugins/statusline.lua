local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

local function update_mode_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = "%#StatusLineAccent#"
  if current_mode == "n" then
    mode_color = "%#StatuslineAccent#"
  elseif current_mode == "i" or current_mode == "ic" then
    mode_color = "%#StatuslineInsertAccent#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
    mode_color = "%#StatuslineVisualAccent#"
  elseif current_mode == "R" then
    mode_color = "%#StatuslineReplaceAccent#"
  elseif current_mode == "c" then
    mode_color = "%#StatuslineCmdLineAccent#"
  elseif current_mode == "t" then
    mode_color = "%#StatuslineTerminalAccent#"
  end
  return mode_color
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
  if fpath == "" or fpath == "." then
    return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function modified()
  local modifed = ""
  if vim.bo.modified then
    modifed = "●"
  end
  return modifed
end

local open_buffers = function()
  -- Get all listed buffers
  local listed_buffers = vim.fn.getbufinfo({ buflisted = 1 })

  -- Count buffers that are actually modified
  local modified_count = 0
  for _, buf in ipairs(listed_buffers) do
    if buf.changed == 1 then
      modified_count = modified_count + 1
    end
  end

  return string.format(
    " (%s|%s) ",
    #listed_buffers, -- Total listed buffers
    modified_count -- Modified listed buffers
  )
end

local function filename()
  local fname = vim.fn.expand("%:t")

  if fname == "" then
    return ""
  end
  return fname .. " "
end

local function lsp()
  local count = {}
  local levels = {
    errors = vim.log.levels.ERROR,
    warnings = vim.log.levels.WARN,
    info = vim.log.levels.INFO,
    hints = vim.log.levels.DEBUG,
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = "  " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = "  " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = "  " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = "   " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%#Normal#"
end

local function filetype()
  return string.format(" %s ", vim.bo.filetype)
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %l:%L "
end

local vcs = function()
  local git_info = vim.b.gitsigns_status_dict
  local branch_name = vim.b.gitsigns_head
  if not git_info or git_info.head == "" then
    return ""
  end
  local added = git_info.added and ("%#GitSignsAdd#+" .. git_info.added .. " ")
    or ""
  local changed = git_info.changed
      and ("%#GitSignsChange#~" .. git_info.changed .. " ")
    or ""
  local removed = git_info.removed
      and ("%#GitSignsDelete#-" .. git_info.removed .. " ")
    or ""
  if git_info.added == 0 then
    added = ""
  end
  if git_info.changed == 0 then
    changed = ""
  end
  if git_info.removed == 0 then
    removed = ""
  end
  return table.concat({
    " ",
    " ",
    branch_name,
    " ",
    added,
    changed,
    removed,
    " ",
  })
end

local function file_size()
  local file = vim.fn.expand("%:p")
  if file == "" or vim.fn.getfsize(file) < 0 then
    return ""
  end

  local size = vim.fn.getfsize(file)
  if size < 1024 then
    return size .. " B"
  elseif size < 1024 * 1024 then
    return string.format("%.2fKB", size / 1024)
  elseif size < 1024 * 1024 * 1024 then
    return string.format("%.2fMB", size / (1024 * 1024))
  else
    return string.format("%.2fGB", size / (1024 * 1024 * 1024))
  end
end

Statusline = {}

Statusline.active = function()
  return table.concat({
    "%#Statusline#",
    open_buffers(),
    "%#Statusline#",
    update_mode_colors(),
    mode(),
    "%#Statusline#",
    filepath(),
    "%#Normal#",
    filename(),
    modified(),
    "%=%#StatusLineExtra#",
    "%#Statusline#",
    lsp(),
    "%#Statusline#",
    vcs(),
    "%#Statusline#",
    -- filetype(),
    file_size(),
    "%#Statusline#",
    lineinfo(),
  })
end

function Statusline.inactive()
  return " %F"
end

vim.o.laststatus = 3
vim.cmd(
  [[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal noshowmode
  augroup END
]],
  false
)
return {}
