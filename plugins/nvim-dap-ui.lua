vim.pack.add {
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/rcarriga/nvim-dap-ui",
}

local dap, dapui = require("dap"), require("dapui")

dapui.setup()

vim.keymap.set('n', '<leader>duq', function() dapui.close() end, { noremap=true, silent=true, desc = 'dapui close' })
vim.keymap.set('n', '<leader>duo', function() dapui.open() end, { noremap=true, silent=true, desc = 'dapui open' })


dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
