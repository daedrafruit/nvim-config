return {
	'neovim/nvim-lspconfig',
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	config = function()
		local lspconfig = require('lspconfig')

		lspconfig.clangd.setup {
			on_attach = function(client, bufnr)
			end,
		}

		lspconfig.pyright.setup {
			on_attach = function(client, bufnr)
			end,
		}

		lspconfig.lua_ls.setup{
			on_attach = function(client, bufnr)
			end,
		}

	end,
}
