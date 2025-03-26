local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('v', "<space>ca", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>", { noremap = true, silent = true, buffer = bufnr })
  vim.keymap.set("n", '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  vim.keymap.set("n", "<C-o>", jdtls.organize_imports, bufopts)
  vim.keymap.set("n", "<space>ev", jdtls.extract_variable, bufopts)
  vim.keymap.set("n", "<space>ec", jdtls.extract_constant, bufopts)
  vim.keymap.set('v', "<space>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], { noremap = true, silent = true, buffer = bufnr })
end

local home_dir = vim.fn.expand("~")
local mason_dir = home_dir .. "/.local/share/nvim/mason"
local root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" })
local workspace_folder = home_dir .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
  on_attach = on_attach,
  root_dir = root_dir,
  cmd = {
    "/usr/lib/jvm/jdk-21.0.6-oracle-x64/bin/java",
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx4g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', vim.fn.glob(mason_dir .. "/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    '-configuration', mason_dir .. "/packages/jdtls/config_linux",
    '-data', workspace_folder,
  },
}

require('jdtls').start_or_attach(config)
