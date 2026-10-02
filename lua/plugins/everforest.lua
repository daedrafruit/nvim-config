vim.pack.add {
  "https://github.com/neanias/everforest-nvim"
}
require("everforest").setup({
  background = "hard",
  transparent_background_level = 1
})
vim.cmd.colorscheme("everforest")
