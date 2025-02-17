return {
  "mfussenegger/nvim-dap",
  enabled = false,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "leoluz/nvim-dap-go",
  },

  cmd = {
    "DapToggleBreakpoint",
    "DapContinue",
  },
  keys = {
    { "<leader>db", ":DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
    { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Continue" },
    { "<leader>dt", "<cmd>DapTerminate<cr>", desc = "Terminate" },
    { "<leader>dn", "<cmd>DapStepOver<cr>", desc = "StepOver(Next Fn)" },
    { "<leader>do", "<cmd>DapStepOut<cr>", desc = "StepOut" },
    { "<leader>di", "<cmd>DapStepInto<cr>", desc = "StepInto" },
    {
      "<leader>df",
      function()
        require("dapui").float_element()
      end,
      desc = "Floating Window",
    },
    {
      "<leader>de",
      function()
        require("dapui").eval(nil, { enter = true })
      end,
      desc = "Eval",
    },
  },
  config = function()
    require("dapui").setup({
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.4,
            },
            {
              id = "stacks",
              size = 0.,
            },
            {
              id = "breakpoints",
              size = 0.2,
            },
          },
          position = "left",
          size = 50,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.5,
            },
            {
              id = "watches",
              size = 0.5,
            },
          },
          position = "bottom",
          size = 15,
        },
      },
    })
    require("dap-go").setup({})
    require("nvim-dap-virtual-text").setup({
      virt_text_pos = "eol",
    })

    local dap, dapui = require("dap"), require("dapui")

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "::1",
      port = 8123,
      executable = {
        command = "js-debug-adapter",
      },
    }

    for _, language in ipairs({
      "typescript",
      "javascript",
      "typesciptreact",
      "javascriptreact",
    }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "node",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          -- processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
        },
      }
    end

    vim.fn.sign_define("DapBreakpoint", {
      text = "🔴",
      texthl = "DapBreakpoint",
      linehl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    })
  end,
}
