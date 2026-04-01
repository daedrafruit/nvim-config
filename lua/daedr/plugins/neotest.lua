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
      { "<leader>ta", function() require("neotest").run.attach() end, desc = "test attach" },
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "test run file" },
      { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "test run all files" },
      { "<leader>tr", function() require("neotest").run.run() end, desc = "test run nearest" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "test run last" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "test summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "test output" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "test output panel" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "test stop" },
      { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "test watch file" },
      { "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "test debug nearest" },
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
