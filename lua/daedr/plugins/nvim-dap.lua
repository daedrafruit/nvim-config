return {
	'mfussenegger/nvim-dap',
	keys = {
    { "<F5>",  function() require("dap").continue() end },
    { "<F10>", function() require("dap").step_over() end },
    { "<F11>", function() require("dap").step_into() end },
    { "<S-F11>", function() require("dap").step_out() end },

    { "<leader>db", function() require("dap").toggle_breakpoint() end },
    { "<F9>", function() require("dap").toggle_breakpoint() end },

    { "<leader>dB", function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, desc = "DAP Conditional Breakpoint" },
    { "<S-F9>", function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, desc = "DAP Conditional Breakpoint" },

    { "<leader>dlp", function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end, desc = "DAP Log Point" },

    { "<leader>dR", function() require("dap").repl.toggle() end },
    { "<leader>dq", function() require("dap").terminate() end },
    { "<S-F5>",   function() require("dap").terminate() end },
  },
	config = function()

		local dap = require('dap')

		--C++
		dap.adapters.cppdbg = {
		id = 'cppdbg',
		type = 'executable',
		command = vim.fn.stdpath("data") .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
			options = {
				detached = false
			}
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopAtEntry = false,
				setupCommands = {
					{
						text = '-enable-pretty-printing',
						description = 'enable pretty printing',
						ignoreFailures = false
					},
				},
			},
		}

		--C
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-i", "dap" }
		}

		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = true,
			},
		}

		--godot
		dap.adapters.godot = {
			type = "server",
			command = "127.0.0.1",
			port = 6006
		}

		dap.configurations.gdscript = {
			{
				type = "godot",
				request = "launch",
				name = 'Launch scene',
				project = "${workspaceFolder}",
				launch_scene = true,
			},
		}
		dap.adapters.java = {
			type = 'server',
			host = '127.0.0.1',
			port = 5005,
		}

		require('jdtls').setup_dap({ hotcodereplace = 'auto' })
		dap.configurations.java = {
			{
				type = 'java',
				name = 'Debug (Attach)',
				request = 'attach',
				hostName = '127.0.0.1',
				port = 5005,
			},
		}
	end,
}
