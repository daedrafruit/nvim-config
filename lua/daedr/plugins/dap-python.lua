return {
		'mfussenegger/nvim-dap-python',
		ft = { python },
		config = function()
			require("dap-python").setup(is_windows
				and vim.fn.stdpath("data") .. "\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe"
				or vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
			)
		end,
}
