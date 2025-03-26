-- Set the leader key for key mappings.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- change cwd
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true, silent = true })
-- Change to the parent directory of the current file's directory
vim.keymap.set('n', '<leader>cD', ':cd %:p:h:h<CR>:pwd<CR>', { noremap = true, silent = true })

-- make/run 
vim.keymap.set('n', '<leader>mb', ':wa<CR>:!make<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>mm', ':wa<CR>:!make<CR>:!./run<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>mc', ':!make clean<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>mr', ':!make run<CR>', { noremap = true, silent = true })

-- use leader for window commands
vim.keymap.set('n', '<leader>w', '<C-w>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wv', '<C-w>v<CR><C-w>w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ws', '<C-w>s<CR><C-w>w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w,', '5<C-w><<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w.', '5<C-w>><CR>', { noremap = true, silent = true })


