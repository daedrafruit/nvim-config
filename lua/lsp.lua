local capabilities = vim.lsp.protocol.make_client_capabilities()

--lua
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  filetypes = { "lua" },
  cmd = { "lua-language-server" },
  settings = {
    Lua = { diagnostics = { globals = { "vim" } } },
  },
})
vim.lsp.enable("lua_ls")

--python
vim.lsp.config("pyright", {
  capabilities = capabilities,
  filetypes = { "python" },
  cmd = { "pyright-langserver", "--stdio" },
})
vim.lsp.enable("pyright")

--c/cpp
vim.lsp.config("clangd", {
  capabilities = capabilities,
  filetypes = { "c", "cpp" },
  cmd = { "clangd" },
})
vim.lsp.enable("clangd")

--html
vim.lsp.config("html", {
  capabilities = capabilities,
  filetypes = { "html" },
  cmd = { "vscode-html-language-server", "--stdio" },
})
vim.lsp.enable("html")

