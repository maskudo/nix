return {
  {
    "folke/snacks.nvim",
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {},
    keys = {
      {
        "<leader>ox",
        require("helpers.toggle_checkbox").toggle,
        desc = "Toggle Checkbox",
      },
      {
        "<leader>of",
        function()
          Snacks.picker.smart({
            dirs = { "$HOME/zt/notes" },
            multi = { "files" },
            filter = { cwd = true },
            exclude = { ".obsidian", "aegis*" },
          })
        end,
        desc = "Notes",
      },
      {
        "<leader>o/",
        function()
          Snacks.picker.grep({
            dirs = { "$HOME/zt/notes" },
            filter = { cwd = true },
            exclude = { ".obsidian", "aegis*" },
          })
        end,
        desc = "Grep Notes",
      },
      {
        "<leader>od",
        function()
          local filename = os.date("%Y-%m-%d")
          local filepath = "$HOME/zt/notes/dailies/" .. filename .. ".md"
          local res = vim.uv.fs_stat(filepath)
          if res == nil then
            vim.ui.input(
              { prompt = "Create daily note for " .. filename .. "? (y/n)" },
              function(choice)
                if choice == "y" then
                  vim.cmd("edit " .. filepath)
                end
              end
            )
          else
            vim.cmd("edit " .. filepath)
          end
        end,
        desc = "Create Daily Note",
      },
      {
        "<leader>on",
        function()
          vim.ui.input({ prompt = "Enter filename" }, function(filename)
            if not filename then
              return
            end
            local filepath = "$HOME/zt/notes/inbox/" .. filename .. ".md"
            vim.cmd("edit " .. filepath)
          end)
        end,
        desc = "Create Note",
      },
    },
  },
}
