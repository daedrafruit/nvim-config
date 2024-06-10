require("nvim-tree").setup()

local api = require "nvim-tree.api"

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

-- Update nvim-tree root directory when the working directory changes
vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    require('nvim-tree.api').tree.change_root(vim.fn.getcwd())
  end
})

-- nvim-tree setup
require('nvim-tree').setup {
  update_cwd = true,  -- Automatically update the root directory of the tree on `DirChanged` event
}

