-- Highlight, edit, and navigate code
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
          max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
        },
      },
    },
    config = function()
      local ts = require("nvim-treesitter")
      local parsers = {
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
        "go",
        "yaml",
        "markdown",
        "markdown_inline",
        "sql",
        "rust",
        "toml",
      }

      for _, parser in ipairs(parsers) do
        ts.install(parser)
      end

      -- Not every tree-sitter parser is the same as the file type detected
      -- So the patterns need to be registered more cleverly
      local patterns = {}
      for _, parser in ipairs(parsers) do
        local parser_patterns = vim.treesitter.language.get_filetypes(parser)
        for _, pp in pairs(parser_patterns) do
          table.insert(patterns, pp)
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = patterns,
        callback = function()
          vim.treesitter.start()
        end,
      })

      require("nvim-treesitter-textobjects").setup({
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
      })
      vim.keymap.set({ "n", "x", "o" }, "]a", function()
        require("nvim-treesitter-textobjects.move").goto_next_start(
          "@parameter.inner",
          "textobjects"
        )
      end)

      vim.keymap.set({ "n", "x", "o" }, "[a", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start(
          "@parameter.inner",
          "textobjects"
        )
      end)
      vim.keymap.set({ "n", "x", "o" }, "]f", function()
        require("nvim-treesitter-textobjects.move").goto_next_start(
          "@function.outer",
          "textobjects"
        )
      end)

      vim.keymap.set({ "n", "x", "o" }, "[f", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start(
          "@function.outer",
          "textobjects"
        )
      end)
    end,
  },
}
