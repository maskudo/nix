-- Miscelaneous fun stuff
return {
  {
    "echasnovski/mini.comment",
    event = "BufEnter",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring()
              or vim.bo.commentstring
        end,
      },
    },
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        opts = {
          enable_autocmd = false,
        },
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "kazhala/close-buffers.nvim",
    event = "VeryLazy",
    opts = {
      preserve_window_layout = { "this", "nameless" },
    },
  },
  { "tpope/vim-surround", event = "VeryLazy" }, -- Surround stuff with the ys-, cs-, ds- commands
  {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        buftypes = {},
      })
    end,
  },
  {
    "folke/flash.nvim",
    -- event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = false,
        },
      },
    },
    lazy = true,
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "barrett-ruth/live-server.nvim",
    build = "npm i --global live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
    lazy = true,
  },
}
