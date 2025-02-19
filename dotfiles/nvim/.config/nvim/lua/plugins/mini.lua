return {
  "echasnovski/mini.nvim",
  version = false,
  event = "VimEnter",
  config = function()
    require("mini.ai").setup()
    require("mini.doc").setup()
    require("mini.git").setup()
    require("mini.jump").setup({ silent = true })
    require("mini.extra").setup()
    require("mini.pairs").setup()
    require("mini.icons").setup()
    require("mini.icons").mock_nvim_web_devicons()
    require("mini.colors").setup()
    require("mini.surround").setup()
    require("mini.splitjoin").setup()
    require("mini.trailspace").setup()
    require("mini.jump2d").setup({
      view = {
        dim = true,
        n_steps_ahead = 2,
      },
    })
    require("mini.operators").setup({
      -- Exchange text regions
      exchange = {
        prefix = "ge",
      },
      sort = {
        prefix = "",
      },
    })
    require("mini.bracketed").setup({
      file = { suffix = "", options = {} },
      treesitter = { suffix = "t", options = {} },
    })

    require("plugins.mini.files")
    require("plugins.mini.colors")
    require("plugins.mini.hipatterns")
    require("plugins.mini.clue")
    require("plugins.mini.sessions")
  end,
}
