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

dap.configurations.java = {
  {
    type = "java",
    request = "attach",
    name = "Run Gradle and Attach",
    hostName = "127.0.0.1",
    port = 5005,
    program = function()
      vim.fn.jobstart(
        'gradle run',
        {
          on_exit = function(_, code)
						print("Gradle exited with code", code)
          end
        }
      )
		end,
    mainClass = function()
      local content = io.open('build.gradle'):read('*a') or
      	print("Could not find main class in build.gradle")
      return content:match("mainClass%s*=%s*['\"]([%w%.]+)['\"]") or
      	print("Could not find main class in build.gradle")
    end,
    projectName = function()
      local content = io.open('settings.gradle'):read('*a') or
      	print("Could not find project name in settings.gradle")
      return content:match("rootProject%.name%s*=%s*['\"]([%w-]+)['\"]") or
      	print("Could not find project name in settings.gradle")
    end
  }
}
