return {
	'hrsh7th/nvim-cmp', 
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip'
	},
	event = 'InsertEnter',
	config = function()
		local cmp = require('cmp')

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<TAB>'] = cmp.mapping.confirm({ select = true }), 
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'vsnip' },

			}, {
				{ name = 'buffer' },
			})
		})
	end,
}
