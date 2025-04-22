local function get_html_server_cmd()
    local is_windows = vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1

    local server_path
    if is_windows then
        server_path = vim.fn.stdpath("data") .. "\\mason\\bin\\vscode-html-language-server.cmd"
    else
        server_path = vim.fn.stdpath("data") .. "/mason/bin/vscode-html-language-server"
    end

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
