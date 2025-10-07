return {
	'mfussenegger/nvim-dap',
	keys = {
			{ '<F5>', ':DapContinue<CR>', { noremap = true, silent = true } },
			{ '<F10>', ':DapStepOver<CR>', { noremap = true, silent = true } },
			{ '<F11>', ':DapStepInto<CR>', { noremap = true, silent = true } },
			{ '<S-F11>', ':DapStepOut<CR>', { noremap = true, silent = true } },

			{ '<leader>db', ':DapToggleBreakpoint<CR>', { noremap = true, silent = true } },
			{ '<F9>', ':DapToggleBreakpoint<CR>', { noremap = true, silent = true } },

			{ '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { noremap = true, silent = true } },
			{ '<S-F9>', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { noremap = true, silent = true } },

			{ '<leader>dlp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { noremap = true, silent = true } },
			{ '<leader>dR', ':DapToggleRepl<CR>', { noremap = true, silent = true } },

			{ '<leader>dq', ':DapTerminate<CR>', { noremap = true, silent = true } },
			{ '<S-F5>', ':DapTerminate<CR>', { noremap = true, silent = true } },
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
