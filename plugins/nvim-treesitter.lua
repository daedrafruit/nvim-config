vim.pack.add {
	'https://github.com/nvim-treesitter/nvim-treesitter',
}

require("nvim-treesitter").setup({
  ensure_installed = {
    "cpp",
    "c",
    "lua",
    "python",
    "vim",
    "vimdoc",
    "query",
    "gdscript"
  },

  sync_install = false,

  auto_install = true,
  highlight = {
    enable = true,
  },
})
