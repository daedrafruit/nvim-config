return {
	'rcarriga/nvim-dap-ui',
	lazy = true,
	keys = { "<leader>dr" },
	dependencies = { 'nvim-neotest/nvim-nio' },
	config = function()
		require("dapui").setup()

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

		vim.keymap.set('n', '<leader>duq', function() require'dapui'.close() end, { noremap = true, silent = true })
	end,
}


