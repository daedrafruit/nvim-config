require("nvim-tree").setup()

local api = require "nvim-tree.api"

vim.g.nvim_tree_respect_buf_cwd = true

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

api.sync_root_with_cwd = true
  update_focused_file = {
                  enable = true,
                  update_root = true,

               }
