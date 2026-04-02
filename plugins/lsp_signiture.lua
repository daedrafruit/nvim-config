vim.pack.add {
  "https://github.com/ray-x/lsp_signature.nvim",
}
require("lsp_signature").setup({
  hint_enable = false,
  doc_lines = 0,
  handler_opts = {
    border = "single"
  }
})
