vim.pack.add { "https://github.com/nvim-treesitter/nvim-treesitter" }

local parsers = {
  "cpp",
  "c",
  "lua",
  "python",
  "vim",
  "vimdoc",
  "query",
  "gdscript",
  "javascript",
  "typescript",
  "tsx",
}

require("nvim-treesitter").install(parsers)

--kinda hacky, starts treesitter for all ft 
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function() pcall(vim.treesitter.start) end,
})
