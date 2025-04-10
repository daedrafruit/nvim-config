return {
	'nvim-treesitter/nvim-treesitter',
	event = { "BufReadPre", "BufNewFile" },
	build = ':TSUpdate',
	config = function()
		require("nvim-treesitter").setup()
			require "nvim-treesitter.configs".setup {
				ensure_installed = { "cpp", "c", "lua", "python", "vim", "vimdoc", "query" },

				sync_install = false,

				auto_install = true,
				highlight = {
					enable = true,
				},
			}
	end,
}
