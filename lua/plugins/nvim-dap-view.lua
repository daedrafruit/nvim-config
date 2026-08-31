vim.pack.add({
 { src = "https://github.com/igorlfs/nvim-dap-view", version = vim.version.range("1.*")  },
})

vim.keymap.set('n', '<leader>dv', function() require("dap-view").toggle() end, { noremap=true, silent=true, desc = 'dapview open' })

vim.keymap.set('n', '<leader>dt', function() require("dap-view").virtual_text_toggle() end, { noremap=true, silent=true, desc = 'dapview open' })

require("dap-view").setup({
  winbar = {
    controls = {
      enabled = true,
    },
  },
})
