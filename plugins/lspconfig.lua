vim.pack.add { "https://github.com/neovim/nvim-lspconfig" }

vim.lsp.config('lua_ls', {
  settings = {
    Lua = { diagnostics = { globals = { "vim" } } },
  },
})

vim.lsp.config('ts_ls', {
  filetypes = { "javascriptreact" },
})

vim.lsp.enable({
  'lua_ls',
  'pyright',
  'clangd',
  'html',
  'gdscript',
  'ts_ls'
})
