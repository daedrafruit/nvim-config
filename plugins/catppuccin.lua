vim.pack.add {
  "https://github.com/catppuccin/nvim"
}
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
vim.cmd.colorscheme("catppuccin")
