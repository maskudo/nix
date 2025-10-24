local function scratchByFt()
  local engines = { javascript = "node", python = "python" }
  local win_by_ft = {}
  for lang, engine in pairs(engines) do
    win_by_ft[lang] = {
      keys = {
        ["source"] = {
          "<CR>",
          function(self)
            local name = vim.api.nvim_buf_get_name(self.buf)
            local res = vim.system({ engine, name }, { text = false }):wait()
            local previous_win = vim.api.nvim_get_current_win()
            Snacks.win({
              text = res.stdout or res.stderr,
              position = "bottom",
              height = 0.25,
              width = 1,
              keys = {
                ["q"] = {
                  "close_and_focus",
                  desc = "Close and Focus",
                  mode = { "n" },
                },
              },
              actions = {
                close_and_focus = function(ctx)
                  ctx:close()
                  vim.api.nvim_set_current_win(previous_win)
                end,
              },
            })
          end,
          desc = "Source buffer",
          mode = { "n", "x" },
        },
      },
    }
  end
  return win_by_ft
end

return {
  "folke/snacks.nvim",
  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    scratch = {
      win = {
        position = "float",
        border = "single",
        height = 1,
        width = 0.3,
      },
      win_by_ft = scratchByFt(),
    },
  },
  keys = {
    {
      "<leader>sc",
      function()
        Snacks.picker.scratch()
      end,
      desc = "Scratch Buffer",
      mode = { "n", "v" },
    },
    {
      "<leader>ssb",
      function()
        Snacks.scratch.open({ win = { width = 0.5, height = 0.5 } })
      end,
      desc = "Scratch Buffer",
      mode = { "n", "v" },
    },
    {
      "<leader>ssm",
      function()
        Snacks.scratch.open({
          win = { width = 0.5, height = 0.5 },
          ft = "markdown",
        })
      end,
      desc = "Scratch Buffer JS",
      mode = { "n", "v" },
    },
    {
      "<leader>ssj",
      function()
        Snacks.scratch.open({
          win = { width = 0.5, height = 0.5 },
          ft = "javascript",
        })
      end,
      desc = "Scratch Buffer JS",
      mode = { "n", "v" },
    },
    {
      "<leader>ssp",
      function()
        Snacks.scratch.open({
          win = { width = 0.5, height = 0.5 },
          ft = "python",
        })
      end,
      desc = "Scratch Buffer Python",
      mode = { "n", "v" },
    },
    {
      "<leader>ssl",
      function()
        vim.ui.input({ prompt = "Enter language:" }, function(lang)
          if not lang or #lang == 0 then
            return
          end
          Snacks.scratch.open({ win = { width = 0.5, height = 0.5 }, ft = lang })
        end)
      end,
      desc = "Scratch Buffer ft",
      mode = { "n", "v" },
    },
    {
      "<leader>sss",
      function()
        Snacks.picker.scratch()
      end,
      desc = "List Scratch Buffer",
      mode = { "n", "v" },
    },
  },
}
