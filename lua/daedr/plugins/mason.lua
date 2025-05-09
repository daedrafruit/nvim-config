return {
	'williamboman/mason.nvim',
	dependencies = { 'williamboman/mason-lspconfig.nvim' },
  cmd = { "Mason", "MasonInstall", "MasonUpdate" },
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		})

		local mason_registry = require("mason-registry")

		local ensure_installed = {
			"clangd", --cpp lsp
			"cpptools", --cpp debugger		
			"pyright", --python lsp
			"debugpy", --python debugger
			"lua-language-server", --lua lsp
			"html-lsp", --html lsp
		}

		for _, tool in ipairs(ensure_installed) do
			local package = mason_registry.get_package(tool)
			if not package:is_installed() then
				package:install()
			end
		end
	end,
}

