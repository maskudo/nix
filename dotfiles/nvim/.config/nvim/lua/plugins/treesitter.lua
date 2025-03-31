-- Highlight, edit, and navigate code
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    build = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = { "BufReadPost", "BufNewFile" },
      },
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
          max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
        },
      },
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        sync_install = false,
        auto_install = true,
        ensure_installed = {
          "c",
          "cpp",
          "javascript",
          "jsdoc",
          "html",
          "css",
          "rust",
          "lua",
          "bash",
          "typescript",
          "tsx",
          "python",
          "racket",
          "go",
          "yaml",
          "markdown",
          "markdown_inline",
          "ninja",
          "sql",
          "rust",
          "toml",
        },
        highlight = { enable = true },
        indent = { enable = true, disable = { "python" } },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-backspace>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["aA"] = "@parameter.outer",
              ["iA"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              -- ["ac"] = "@class.outer",
              -- ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]a"] = "@parameter.inner",
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]A"] = "@parameter.inner",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[a"] = "@parameter.inner",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[A"] = "@parameter.inner",
            },
          },
        },
      })
    end,
  },
}
