return {
  {
    "rcasia/neotest-java",
    ft = "java",
    dependencies = {
      "mfussenegger/nvim-jdtls",
      "mfussenegger/nvim-dap", -- for the debugger
      "rcarriga/nvim-dap-ui", -- recommended
      "theHamsta/nvim-dap-virtual-text", -- recommended
    },
  },
 {
  "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{ "<leader>ta", function() require("neotest").run.attach() end },
			{ "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end }, -- run file
			{ "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end }, -- run all files
			{ "<leader>tr", function() require("neotest").run.run() end }, -- run nearest
			{ "<leader>tl", function() require("neotest").run.run_last() end },
			{ "<leader>ts", function() require("neotest").summary.toggle() end },
			{ "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end },
			{ "<leader>tO", function() require("neotest").output_panel.toggle() end },
			{ "<leader>tS", function() require("neotest").run.stop() end },
			{ "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end },
			{ "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end }, -- debug test
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-java")({
						-- config here
					}),
				},
			})
		end,
	}
}
