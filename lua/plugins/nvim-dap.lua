vim.pack.add { "https://github.com/mfussenegger/nvim-dap" }

local dap = require('dap')

vim.keymap.set('n', '<F5>',        function() dap.continue() end, { desc = "dap continue" })
vim.keymap.set('n', '<leader>dr',  function() dap.continue() end, { desc = "dap continue" })
vim.keymap.set('n', "<F10>",       function() dap.step_over() end, { desc = "dap step over" })
vim.keymap.set('n', "<F11>",       function() dap.step_into() end, { desc = "dap step into" })
vim.keymap.set('n', "<S-F11>",     function() dap.step_out() end, { desc = "dap step out" })
vim.keymap.set('n', "<F23>",     function() dap.step_out() end, { desc = "dap step out" })
vim.keymap.set('n', "<leader>db",  function() dap.toggle_breakpoint() end, { desc = "dap toggle breakpoint" })
vim.keymap.set('n', "<F9>",        function() dap.toggle_breakpoint() end, { desc = "dap toggle breakpoint" })
vim.keymap.set('n', "<leader>dB",  function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "dap conditional breakpoint" })
vim.keymap.set('n', "<S-F9>",      function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "dap conditional breakpoint" })
vim.keymap.set('n', "<F21>",      function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "dap conditional breakpoint" })
vim.keymap.set('n', "<leader>dlp", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, { desc = "dap log point" })
vim.keymap.set('n', "<leader>dR",  function() dap.repl.toggle() end, { desc = "dap toggle REPL" })
vim.keymap.set('n', "<leader>dq",  function() dap.terminate() end, { desc = "dap terminate" })
vim.keymap.set('n', "<S-F5>",      function() dap.terminate() end, { desc = "dap terminate" })
vim.keymap.set('n', "<F17>",      function() dap.terminate() end, { desc = "dap terminate" })

--prompt for program, prefilled from the last line of `make -n run`
local function make_run_program()
  local out = vim.fn.systemlist("make -n run")
  local default = vim.v.shell_error == 0 and vim.split(out[#out], " ")[1] or ""
  return vim.fn.input('Path to executable: ', default, 'file')
end

--C++
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = vim.fn.stdpath("data") .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
  options = { detached = false }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = make_run_program,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
    setupCommands = {
      { text = '-enable-pretty-printing', description = 'enable pretty printing', ignoreFailures = false },
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
    program = make_run_program,
    cwd = "${workspaceFolder}",
  },
}

--try to use .vscode/launch.json
local global_configs = dap.providers.configs["dap.global"]
dap.providers.configs["dap.global"] = function(bufnr)
  if vim.uv.fs_stat(vim.fn.getcwd() .. "/.vscode/launch.json") then return {} end
  return global_configs(bufnr)
end

--java attach, see also ftplugin
dap.configurations.java = {
  {
    type = "java",
    request = "attach",
    name = "Attach (5005)",
    hostName = "127.0.0.1",
    port = 5005,
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

dap.adapters["pwa-chrome"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "js-debug-adapter",
    args = { "${port}" },
  },
}

dap.configurations.javascriptreact = {
  {
    type = "pwa-chrome",
    request = "launch",
    name = "Debug React App",
    url = "http://localhost:5173",
    webRoot = "${workspaceFolder}",
  },
}
