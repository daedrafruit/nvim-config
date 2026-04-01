return {
	'mfussenegger/nvim-dap',
	
	keys = {
		{ '<F5>', function() require("dap").continue() end, desc = "dap continue" },
		{ '<leader>dr', function() require("dap").continue() end, desc = "dap continue" },
    { "<F10>", function() require("dap").step_over() end, desc = "dap step over" },
    { "<F11>", function() require("dap").step_into() end, desc = "dap step into" },
    { "<S-F11>", function() require("dap").step_out() end, desc = "dap step out" },

    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "dap toggle breakpoint" },
    { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "dap toggle breakpoint" },

    { "<leader>dB", function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, desc = "dap conditional breakpoint" },
    { "<S-F9>", function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, desc = "dap conditional breakpoint" },

    { "<leader>dlp", function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end, desc = "dap log point" },

    { "<leader>dR", function() require("dap").repl.toggle() end, desc = "dap toggle REPL" },
    { "<leader>dq", function() require("dap").terminate() end, desc = "dap terminate" },
    { "<S-F5>",   function() require("dap").terminate() end, desc = "dap terminate" },
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

    --java, this is just the attach see ftplugin for more 
    dap.configurations.java = {
      {
        type = "java",
        request = "attach",
        name = "Attach (5005)",
        hostName = "127.0.0.1",
        port = 5005,
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

    dap.adapters["pwa-chrome"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "js-debug-adapter",
        args = { "${port}" },
      },
    }

    dap.configurations.javascriptreact = {
      {
        type = "pwa-chrome",
        request = "launch",
        name = "Debug React App",
        url = "http://localhost:5173",
        webRoot = "${workspaceFolder}",
      },
    }

	end,
}
