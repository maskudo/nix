return {
	"mfussenegger/nvim-dap",
	enabled = true,
	dependencies = {
		"rcarriga/nvim-dap-ui",

		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"leoluz/nvim-dap-go",
	},

	cmd = {
		"DapToggleBreakpoint",
		"DapContinue",
		"DapTerminate",
		"DapStepOver",
	},
	keys = {
		{ "<leader>Db", ":DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
		{ "<leader>Dc", "<cmd>DapContinue<cr>", desc = "DAP Continue" },
		{ "<leader>Dt", "<cmd>DapTerminate<cr>", desc = "DAP Terminate" },
		{ "<leader>Ds", "<cmd>DapStepOver<cr>", desc = "DAP StepOver" },
	},
	config = function()
		require("dapui").setup()
		require("dap-go").setup({})
		require("nvim-dap-virtual-text").setup({})

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

		for _, language in ipairs({ "typescript", "javascript" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
					runtimeExecutable = "node",
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
