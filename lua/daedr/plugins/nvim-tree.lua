
return {
	'nvim-tree/nvim-tree.lua',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {{ '<leader>n', '<cmd>:NvimTreeFindFileToggle<cr>' }},
	config = function()
		require("nvim-tree").setup()

		local api = require "nvim-tree.api"

		-- Update nvim-tree root directory when the working directory changes
		vim.api.nvim_create_autocmd("DirChanged", {
			callback = function()
				require('nvim-tree.api').tree.change_root(vim.fn.getcwd())
			end
		})

		-- nvim-tree setup
		require('nvim-tree').setup {
			hijack_directories = {
				enable = false,
				auto_open = false,
			},
			update_cwd = true,  -- Automatically update the root directory of the tree on `DirChanged` event
		}
	end,
}


