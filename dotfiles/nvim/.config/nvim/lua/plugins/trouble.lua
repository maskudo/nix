return {
  "folke/trouble.nvim",
  lazy = true,
  enabled = false,
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Workplace diagnostics",
    },
    {
      "<leader>xb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer diagnostics",
    },
    {
      "<leader>xl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Trouble Loclist",
    },
    {
      "<leader>xq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Trouble Quickfix",
    },
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  specs = {
    "folke/snacks.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts or {}, {
        picker = {
          actions = require("trouble.sources.snacks").actions,
          win = {
            input = {
              keys = {
                ["<c-q>"] = {
                  "trouble_open",
                  mode = { "n", "i" },
                },
              },
            },
          },
        },
      })
    end,
  },
}
