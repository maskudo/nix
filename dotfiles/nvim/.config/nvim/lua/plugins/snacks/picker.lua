local gitActions = {
  hidden = true,
  include = { ".env*", "*.nix" },
  actions = {
    ["open_file"] = function(picker)
      local currentCommit = picker:current().commit
      picker:close()
      vim.cmd("Gitsigns show " .. currentCommit)
    end,
    ["diffview"] = function(picker)
      local currentCommit = picker:current().commit
      picker:close()
      vim.cmd("vs")
      require("gitsigns").show(currentCommit)
    end,
  },
  win = {
    input = {
      keys = {
        ["<CR>"] = {
          "open_file",
          desc = "Open File",
          mode = { "n", "i" },
        },
        ["<c-d>"] = {
          "diffview",
          desc = "Diffview",
          mode = { "n", "i" },
        },
      },
    },
  },
}

local fileActions = {
  hidden = true,
  include = { ".env*", "*.nix" },
  actions = {
    ["send_to_grep"] = function(picker)
      local current = picker.input:get()
      picker:close()
      Snacks.picker.grep({
        glob = "*" .. current .. "*",
        hidden = true,
        title = "Glob: " .. current,
      })
    end,
  },
  win = {
    input = {
      keys = {
        ["<c-h>"] = {
          "toggle_ignored",
          desc = "Toggle Ignored",
          mode = { "n", "i" },
        },
        ["<c-r>"] = {
          "send_to_grep",
          desc = "Send to Grep",
          mode = { "n", "i" },
        },
      },
    },
  },
}

return {
  "folke/snacks.nvim",
  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    picker = {
      formatters = {
        file = {
          filename_first = true,
        },
      },
      win = {
        input = {
          keys = {
            ["<c-l>"] = {
              "cycle_win",
              desc = "Cycle Window",
              mode = { "n", "i" },
            },
          },
        },
      },
      sources = {
        git_log_file = gitActions,
        git_log = gitActions,
        files = fileActions,
        smart = fileActions,
        buffers = {
          win = {
            input = {
              keys = {
                ["<space><space>"] = {
                  "switch_to_smart",
                  desc = "Switch to smart",
                  mode = { "n", "i" },
                },
                ["<s-m>"] = {
                  "toggle_modified",
                  desc = "Toggle modified",
                  mode = { "n", "i" },
                },
              },
            },
          },
          actions = {
            ["switch_to_smart"] = function(picker)
              local current = picker.input:get()
              picker:close()
              Snacks.picker.smart({ pattern = current })
            end,
          },
        },
      },
      layout = {
        preset = "telescope",
      },
    },
  },
  -- stylua: ignore 
	keys = {
		{"gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition",},
		{"gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation",},
		{"<leader>lr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References",},
		{"gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition",},
		{"<C-\\>", mode = { "n", "t", "i" }, function() Snacks.terminal.toggle("zsh") end, desc = "Toggle Terminal",},
		{"<C-g>", function() Snacks.lazygit() end, desc = "Lazygit",},
		{"<leader>.", function() Snacks.picker.smart({ hidden = true, filter = { cwd = true } }) end, desc = "Find Files",},
		{"<leader>/", function() Snacks.picker.grep({ hidden = true }) end, desc = "Grep",},
		{"<leader>:", function() Snacks.picker.command_history() end, desc = "Command History",},
		{"<leader><space>", function() Snacks.picker.buffers({ sort_lastused = true, supports_live = true }) end, desc = "Buffers",},
		{"<leader>bf", function() Snacks.picker.buffers() end, desc = "List Buffers",},
		{"<leader>bg", function() Snacks.picker.grep_buffers() end, desc = "Grep Open buffers",},
		{"<leader>bl", function() Snacks.picker.lines() end, desc = "Buffer Lines",},
		{"<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete Other Buffers",},
		{"<leader>e", function() Snacks.picker.explorer() end, desc = "Explorer",},
		{"<leader>fU", function() Snacks.picker.undo() end, desc = "Undo",},
		{"<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers",},
		{"<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File",},
		{"<leader>fD", function() Snacks.picker.diagnostics({ format = "file", }) end, desc = "Workspace Diagnostics",},
		{"<leader>fd", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics",},
		{"<leader>xx", function() Snacks.picker.diagnostics({ format = "file", }) end, desc = "Workspace Diagnostics",},
		{"<leader>xb", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics",},
		{"<leader>ff", function() Snacks.picker.files({ hidden = true, filter = { cwd = true } }) end, desc = "Find Files",},
		{"<leader>fg", function() Snacks.picker.git_status({ hidden = true }) end, desc = "Find Git Files",},
		{"<leader>fp", function() Snacks.picker.recent({ hidden = true, filter = { cwd = true } }) end, desc = "Recent",},
		{"<leader>fs", function() Snacks.picker.smart({ hidden = true }) end, desc = "Files (smart)",},
		{"<leader>gB", function() Snacks.picker.git_branches() end, desc = "Git Branches",},
		{"<leader>gC", function() Snacks.picker.git_log({ hidden = true }) end, desc = "Git Commits",},
		{"<leader>gY", function() Snacks.gitbrowse.open() end, desc = "Open git link in browser", mode = { "n", "v" },},
		{"<leader>gc", function() Snacks.picker.git_log_file({ hidden = true }) end, desc = "Git Commits (file)",},
		{"<leader>gl", function() Snacks.lazygit() end, desc = "Lazygit",},
		{"<leader>go", function() Snacks.gitbrowse() end, desc = "Open line(s) in browser", mode = { "n", "v" },},
		{"<leader>gy", function() Snacks.gitbrowse.open({ open = function(url) vim.fn.setreg("+", url) vim.notify("Yanked url to clipboard") end, }) end, desc = "Copy line(s) link", mode = { "n", "v" },},
		{"<leader>lS", function() Snacks.picker.lsp_workspace_symbols({ layout = { preset = "telescope", preview = "main" }, filter = { cwd = true }, }) end, desc = "LSP Symbols Workspace",},
		{"<leader>ld", function() Snacks.picker.diagnostics() end, desc = "Diagnostics",},
		{"<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols",},
		{"<leader>sc", function() Snacks.picker.commands() end, desc = "Commands",},
		{"<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps",},
		{"<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages",},
		{"<leader>sP", function() Snacks.picker.projects() end, desc = "Projects",},
		{"<leader>sR", function() Snacks.picker.registers() end, desc = "Registers",},
		{"<leader>sH", function() Snacks.picker.highlights() end, desc = "Help Pages",},
		{"<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages",},
		{"<leader>sm", function() Snacks.picker.marks({ filter = { cwd = true } }) end, desc = "Marks", mode = { "n", "v" },},
		{"<leader>sp", function() Snacks.picker() end, desc = "Picker",},
		{"<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List",},
		{"<leader>sr", function() Snacks.picker.resume() end, desc = "Resume",},
		{"<leader>st", function() Snacks.picker.treesitter() end, desc = "Picker",},
		{"<leader>sT", function() Snacks.picker.treesitter({ filter = { default = { "Class", "Enum", "Field", "Function", "Method", "Module", "Namespace", "Struct", "Trait", "Table", "Object", "Property", "Key", }, }, }) end, desc = "Treesitter",},
		{"<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" },},
	},
}
