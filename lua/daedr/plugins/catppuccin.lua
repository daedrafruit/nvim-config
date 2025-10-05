return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			integrations = {
				telescope = {
					enabled = true,
				},
			},
			transparent_background = true,
			float = {
					transparent = true,
			},
		})

	vim.cmd.colorscheme "catppuccin"
	end,
}
