vim.pack.add {
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/antoinemadec/FixCursorHold.nvim",
  "https://github.com/theHamsta/nvim-dap-virtual-text",
  "https://github.com/rcasia/neotest-java",
  "https://github.com/nvim-neotest/neotest",
}

require("neotest").setup({
  adapters = {
    require("neotest-java")({}),
  },
})

local neotest = require("neotest")

vim.keymap.set("n", "<leader>ta", function() neotest.run.attach() end,                              { desc = "test attach" })
vim.keymap.set("n", "<leader>tt", function() neotest.run.run(vim.fn.expand("%")) end,               { desc = "test run file" })
vim.keymap.set("n", "<leader>tT", function() neotest.run.run(vim.uv.cwd()) end,                     { desc = "test run all files" })
vim.keymap.set("n", "<leader>tr", function() neotest.run.run() end,                                 { desc = "test run nearest" })
vim.keymap.set("n", "<leader>tl", function() neotest.run.run_last() end,                            { desc = "test run last" })
vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end,                          { desc = "test summary" })
vim.keymap.set("n", "<leader>to", function() neotest.output.open({ enter = true, auto_close = true }) end, { desc = "test output" })
vim.keymap.set("n", "<leader>tO", function() neotest.output_panel.toggle() end,                     { desc = "test output panel" })
vim.keymap.set("n", "<leader>tS", function() neotest.run.stop() end,                                { desc = "test stop" })
vim.keymap.set("n", "<leader>tw", function() neotest.watch.toggle(vim.fn.expand("%")) end,          { desc = "test watch file" })
vim.keymap.set("n", "<leader>td", function() neotest.run.run({ strategy = "dap" }) end,             { desc = "test debug nearest" })
