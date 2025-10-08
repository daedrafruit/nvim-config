-- Set the leader key for key mappings.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- change cwd
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true, silent = true })
-- change to the parent directory of the current file's directory
--vim.keymap.set('n', '<leader>cD', ':cd %:p:h:h<CR>:pwd<CR>', { noremap = true, silent = true })
-- change to the root based on .git
vim.keymap.set('n', '<leader>cD', function() root = vim.fs.root(0, '.git') vim.cmd("cd " .. root) end, { noremap = true, silent = true })

--open terminal
vim.keymap.set("n", "<leader>ct", ":botright split<CR>:resize 10<CR>:terminal<CR>:startinsert<CR>")

-- make/run 
vim.keymap.set('n', '<leader>mm', ':wa<CR>:!make<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>mc', ':!make clean<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>mb', ':wa<CR>:!make build<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>mr', ':!make run<CR>', { noremap = true, silent = true })

-- use leader for window commands
vim.keymap.set('n', '<leader>w', '<C-w>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wv', '<C-w>v<CR><C-w>w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ws', '<C-w>s<CR><C-w>w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w,', '5<C-w><<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w.', '5<C-w>><CR>', { noremap = true, silent = true })

--lsp
vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap=true, silent=true })
--show error window
local bufopts = { noremap = true, silent = true}
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
vim.keymap.set('n', '<leader>E', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap=true, silent=true })
