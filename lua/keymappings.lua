-- Set the leader key for key mappings.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- change cwd
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true, silent = true })
-- Change to the parent directory of the current file's directory
vim.keymap.set('n', '<leader>cD', ':cd %:p:h:h<CR>:pwd<CR>', { noremap = true, silent = true })

-- make/run 
vim.keymap.set('n', '<F5>', ':wa<CR>:!make<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F6>', ':!run<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F7>', ':wa<CR>:!make<CR>:!run<CR>', { noremap = true, silent = true })




