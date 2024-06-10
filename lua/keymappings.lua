
-- Set the leader key for key mappings.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- clear seach example
vim.keymap.set ('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true, silent = true })



