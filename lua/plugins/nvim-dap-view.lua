vim.pack.add({
 { src = "https://github.com/igorlfs/nvim-dap-view", version = vim.version.range("1.*")  },
})

vim.keymap.set('n', '<leader>dv', function() require("dap-view").toggle() end, { noremap=true, silent=true, desc = 'dapview open' })
vim.keymap.set('n', '<F3>', function() require("dap-view").toggle() end, { noremap=true, silent=true, desc = 'dapview open' })

vim.keymap.set('n', '<leader>dt', function() require("dap-view").virtual_text_toggle() end, { noremap=true, silent=true, desc = 'dapview toggle virtual text' })

require("dap-view").setup({
  winbar = {
    controls = {
      enabled = true,
    },
    sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "disassembly", "console"},
  },
  --auto_toggle = true,
})
