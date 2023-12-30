return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "TroubleToggle",
  keys = {
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workplace diagnostics" },
    { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document diagnostics" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<crdesc = >",        "Loclist" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<crdesc = >",       "Quickfix" },
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
