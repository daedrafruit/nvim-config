vim.keymap.set('n', '<leader>dr', function() require'dap'.continue() end, { noremap = true, silent = true })

vim.keymap.set('n', '<F9>', ':DapStepOver<CR>' , { noremap = true, silent = true })
vim.keymap.set('n', '<F10>', ':DapStepInto<CR>' , { noremap = true, silent = true })
vim.keymap.set('n', '<F11>', ':DapStepOver<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dB', function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dlp', function() require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dR', 'DapToggleRepl<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dq', ':DapTerminate<CR>', { noremap = true, silent = true })

local dap = require('dap')

local is_windows = vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1

--C++
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = is_windows
    and vim.fn.stdpath("data") .. '\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe'
    or vim.fn.stdpath("data") .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
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
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. (is_windows and '\\' or '/'), 'file')
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
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. (is_windows and '\\' or '/'), 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = true,
  },
}

--Python 
require("dap-python").setup(is_windows
  and vim.fn.stdpath("data") .. "\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe"
  or vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
)
