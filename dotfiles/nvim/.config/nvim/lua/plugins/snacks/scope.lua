return {
  "folke/snacks.nvim",
  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    scope = {},
    indent = {
      enabled = false,
      only_scope = true,
      only_current = false,
      scope = {
        enabled = true,
        underline = false,
      },
    },
  },
  init = function()
    local scope_popup = nil
    local function toggle_scope()
      local scope = require("snacks").scope.get()
      if not scope then
        return
      end
      if scope_popup and vim.api.nvim_win_is_valid(scope_popup) then
        vim.api.nvim_win_close(scope_popup, true) -- Close if already open
        scope_popup = nil
        return
      end
      local lines = { vim.fn.getline(scope.from) }
      -- Create a floating buffer
      local float_buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_buf_set_lines(float_buf, 0, -1, false, lines)

      -- Get window width
      local win_width = vim.api.nvim_win_get_width(0)
      local filetype = vim.api.nvim_get_option_value(
        "filetype",
        { buf = scope.buf, win = scope_popup }
      )

      vim.api.nvim_buf_set_option(float_buf, "filetype", filetype)

      local opts = {
        relative = "editor", -- Fixed to top of editor
        width = win_width, -- Full width of window
        height = #lines,
        col = 0, -- Start from left edge
        row = 0, -- Sticky at the top
        anchor = "NW",
        style = "minimal",
        border = "none",
      }

      scope_popup = vim.api.nvim_open_win(float_buf, false, opts)
      -- Auto-close on CursorMoved or CursorMovedI
    end
    vim.keymap.set("n", "<c-s>", toggle_scope, { desc = "Toggle Scope" })
  end,
}
