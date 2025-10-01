return {
		'mfussenegger/nvim-dap-python',
		ft = 'python',
		config = function()
			require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
			)
		end,
}
