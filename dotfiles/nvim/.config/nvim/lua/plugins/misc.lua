return {
  {
    "maskudo/bharyang.nvim",
    config = function()
      require("bharyang").setup()
    end,
  },
  {
    "maskudo/devdocs.nvim",
    keys = {
      {
        "<leader>ho",
        mode = "n",
        "<cmd>DevDocs get<cr>",
        desc = "Get Devdocs",
      },
      {
        "<leader>hi",
        mode = "n",
        "<cmd>DevDocs install<cr>",
        desc = "Install Devdocs",
      },
    },
    opts = {
      ensure_installed = {
        "go",
        "html",
        "http",
        "css",
        "javascript",
        "lua~5.1",
        "rust",
      },
    },
  },

  {
    "MagicDuck/grug-far.nvim",
    lazy = true,
    cmd = { "GrugFar" },
    keys = {
      {
        "<leader>fR",
        mode = { "n", "x", "o" },
        "<cmd>GrugFar<cr>",
        desc = "Find and Replace",
      },
    },
    opts = {
      engines = {
        ripgrep = {
          extraArgs = "-.",
        },
      },
    },
  },

  {
    "folke/flash.nvim",
    enabled = true,
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          enabled = false, -- Disable character motions (like `f`, `t`, `F`, `T`)
        },
        search = {
          enabled = false, -- Disable search motions (`/`, `?`)
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },
  {
    "rachartier/tiny-cmdline.nvim",
    init = function()
      vim.o.cmdheight = 0
      require("vim._core.ui2").enable({})
    end,
    config = function()
      local tiny = require("tiny-cmdline")
      tiny.setup({
        on_reposition = tiny.adapters.blink,
        native_types = {},
        position = {
          x = "50%", -- horizontal: "0%" = left, "50%" = center, "100%" = right
          y = "30%", -- vertical:   "0%" = top,  "50%" = center, "100%" = bottom
        },
        title = {
          enabled = true,
        },
      })
    end,
  },
}
