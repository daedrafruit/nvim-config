local function get_html_server_cmd()

    local server_path = vim.fn.stdpath("data") .. "/mason/bin/vscode-html-language-server"

    return { server_path, "--stdio" }
end

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

		lspconfig.lua_ls.setup {
			on_attach = function(client, bufnr)
			end,
		}

		lspconfig.html.setup {
			cmd = get_html_server_cmd(),
		}

	end,
}
