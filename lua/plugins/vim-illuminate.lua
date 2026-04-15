vim.pack.add { "https://github.com/RRethy/vim-illuminate" }

require("illuminate").configure({
  providers = { "lsp", "treesitter" },
  delay = 0,
})
