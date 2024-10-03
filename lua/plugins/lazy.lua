local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	
	--package manager (lsp, debuger, etc)
	{ 'williamboman/mason.nvim', dependencies = { 'williamboman/mason-lspconfig.nvim' }},

	--theme
	{ 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
	
	--session management
	{'rmagatti/auto-session'},


	--terminal
	{'akinsho/toggleterm.nvim', config = true},

	--file browser
	{'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons', }},
	--fuzzy finder and grep
	{'nvim-telescope/telescope.nvim', tag='0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }},

	--code fold
	{'kevinhwang91/nvim-ufo', dependencies='kevinhwang91/promise-async'},
	--inline color previews
	{'norcalli/nvim-colorizer.lua'},


	--lsp config
	{'neovim/nvim-lspconfig'},
	--auto complete
	{'hrsh7th/nvim-cmp', dependencies = { --auto complete
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip'
	}},
	--syntax highlighting
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},


	--debugger
	{'mfussenegger/nvim-dap', lazy = true },
	--python
	{'mfussenegger/nvim-dap-python', ft = { 'python' }},
	--ui
	{'rcarriga/nvim-dap-ui', lazy = true, dependencies = { 'nvim-neotest/nvim-nio' }},

	--{'nvim-java/nvim-java'},
})

