require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "%.git/", "%.cache/", "%.o" }, -- Ignore .git directories
  },
  pickers = {
    find_files = {
      hidden = false, -- Show hidden files
      follow = true  -- Follow symlinks
    }
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { noremap = true, silent = true })

