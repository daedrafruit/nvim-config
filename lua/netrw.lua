-- disable banner
vim.g.netrw_banner = 0
-- show dir as tree
-- vim.g.netrw_liststyle = 3

-- open in previous window
vim.g.netrw_browse_split = 4

-- take up 25% of window
vim.g.netrw_winsize = 25

vim.keymap.set('n', '<leader>n', ':let g:netrw_browse_split = 4<CR>:Vex<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>N', ':let g:netrw_browse_split = 0<CR>:Ex<CR>', { noremap = true, silent = true })
