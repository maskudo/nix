return {
  {
    "folke/snacks.nvim",
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
      image = {
        doc = {
          inline = false,
          floating = true,
        },
      },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>ip",
        "<cmd>PasteImage<cr>",
        desc = "Paste image from system clipboard",
      },
    },
  },
}
