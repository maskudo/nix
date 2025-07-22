return {
  "echasnovski/mini.nvim",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      lazy = true,
    },
  },
  version = false,
  event = "VeryLazy",
  config = function()
    require("mini.ai").setup()
    require("mini.doc").setup()
    require("mini.git").setup()
    require("mini.jump").setup({ silent = true })
    require("mini.align").setup()
    require("mini.extra").setup()
    require("mini.pairs").setup()
    require("mini.icons").setup()
    require("mini.icons").mock_nvim_web_devicons()
    require("mini.colors").setup()
    require("mini.surround").setup({
      mappings = {
        replace = "sc", -- Replace surrounding
      },
    })
    require("mini.splitjoin").setup()
    require("mini.visits").setup()
    require("mini.trailspace").setup()

    require("mini.bracketed").setup({
      file = { suffix = "", options = {} },
      treesitter = { suffix = "t", options = {} },
    })
    require("mini.comment").setup({
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring()
            or vim.bo.commentstring
        end,
      },
    })

    require("plugins.mini.files")
    require("plugins.mini.colors")
    require("plugins.mini.hipatterns")
    require("plugins.mini.clue")
    require("plugins.mini.visits")
  end,
}
