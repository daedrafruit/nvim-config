local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	{"nvim-tree/nvim-tree.lua", version = "*", lazy = false, dependencies = { "nvim-tree/nvim-web-devicons", }},

	{'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' }},

	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{ "williamboman/mason.nvim", dependencies = { 'williamboman/mason-lspconfig.nvim' }},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/nvim-cmp', dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip'
	}},

	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

})

