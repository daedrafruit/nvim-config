local capabilities = vim.lsp.protocol.make_client_capabilities()

--keymappings
vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap=true, silent=true })
--show error window
local bufopts = { noremap = true, silent = true}
vim.keymap.set("n", "<leader>e", '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>E', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap=true, silent=true })

--vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap=true, silent=true })
vim.keymap.set("n", "gr", function()
  require("telescope.builtin").lsp_references({
    show_line = false,
    include_declaration = false,
  })
end)

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

