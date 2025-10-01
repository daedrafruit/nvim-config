return {
		'norcalli/nvim-colorizer.lua',
		ft = { 'html', 'css'},
		config = function()
				require'colorizer'.setup { '*'; }
		end,
}
