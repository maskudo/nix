vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    local term_title = vim.b.term_title
    if term_title and term_title:match("lazygit") then
      -- Create lazygit specific mappings
      vim.keymap.set("t", "<C-g>", "<cmd>close<cr>", { buffer = true })
      vim.keymap.set("t", "<leader>gl", "<cmd>close<cr>", { buffer = true })
    end
  end,
})

return {
  "folke/snacks.nvim",
  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    terminal = {
      enabled = true,
      win = {
        position = "float",
        border = "single",
        height = 0.7,
        width = 0.7,
      },
    },
    lazygit = {
      enabled = true,
      configure = false,
      win = {
        position = "float",
        border = "single",
        height = 0,
        width = 0,
      },
    },
  },
  keys = {
    {
      "<C-\\>",
      mode = { "n", "t", "i" },
      function()
        Snacks.terminal.toggle("zsh")
      end,
      desc = "Toggle Terminal",
    },
    {
      "<C-g>",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
  },
}
