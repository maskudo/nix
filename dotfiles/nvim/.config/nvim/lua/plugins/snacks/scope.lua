return {
  "folke/snacks.nvim",
  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    scope = {
      treesitter = {
        blocks = {
          enabled = true,
          "function_declaration",
          "function_definition",
          "method_declaration",
          "method_definition",
          "class_declaration",
          "class_definition",
        },
      },
    },
    indent = {
      enabled = true,
      indent = {
        only_scope = true,
        only_current = false,
      },
      scope = {
        enabled = true,
        underline = false,
      },
      chunk = {
        enabled = true,
      },
    },
  },
}
