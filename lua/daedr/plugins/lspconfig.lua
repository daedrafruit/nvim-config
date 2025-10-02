local function get_html_server_cmd()

    local server_path = vim.fn.stdpath("data") .. "/mason/bin/vscode-html-language-server"

    return { server_path, "--stdio" }
end

vim.lsp.start({
  name = 'Godot',
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
  on_attach = function(client, bufnr)
    vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
  end
})

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

		lspconfig.gdscript.setup{
			cmd = { "nc", "localhost", "6008" },
		}


	end,
}
