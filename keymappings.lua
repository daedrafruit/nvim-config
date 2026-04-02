-- Set the leader key for key mappings.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- change cwd
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true, silent = true, desc = 'cd to current file dir' })
-- change to the parent directory of the current file's directory
--vim.keymap.set('n', '<leader>cD', ':cd %:p:h:h<CR>:pwd<CR>', { noremap = true, silent = true })
-- change to the root based on .git
vim.keymap.set('n', '<leader>cD', function() root = vim.fs.root(0, '.git') vim.cmd("cd " .. root) end, { noremap = true, silent = true, desc = 'cd to git root' })

--open terminal
vim.keymap.set("n", "<leader>ct", ":botright split<CR>:resize 10<CR>:terminal<CR>:startinsert<CR>", { desc = 'open terminal split' })

-- format json
vim.keymap.set('n', '<leader>jq', ':%!jq .<CR>', { noremap = true, silent = true, desc = 'format json with jq' })

-- make/run
vim.keymap.set('n', '<leader>mm', ':wa<CR>:!make<CR>', { noremap = true, silent = true, desc = 'make' })
vim.keymap.set('n', '<leader>mb', ':wa<CR>:!make build<CR>', { noremap = true, silent = true, desc = 'make build' })
vim.keymap.set('n', '<leader>mc', ':!make clean<CR>', { noremap = true, silent = true, desc = 'make clean' })
vim.keymap.set('n', '<leader>mr', ':!make run<CR>', { noremap = true, silent = true, desc = 'make run' })
vim.keymap.set('n', '<leader>mt', ':!make test<CR>', { noremap = true, silent = true, desc = 'make test' })

-- use leader for window commands
vim.keymap.set('n', '<leader>w', '<C-w>', { noremap = true, silent = true, desc = 'window' })
vim.keymap.set('n', '<leader>wv', '<C-w>v<CR><C-w>w<CR>', { noremap = true, silent = true, desc = 'vertical split' })
vim.keymap.set('n', '<leader>ws', '<C-w>s<CR><C-w>w<CR>', { noremap = true, silent = true, desc = 'horizontal split' })
vim.keymap.set('n', '<leader>w,', '5<C-w><<CR>', { noremap = true, silent = true, desc = 'shrink width' })
vim.keymap.set('n', '<leader>w.', '5<C-w>><CR>', { noremap = true, silent = true, desc = 'grow width' })

--difftool
vim.keymap.set('n', '<leader>g1', ':diffget 1<CR>', { noremap = true, silent = true, desc = 'diffget buffer 1' })
vim.keymap.set('n', '<leader>g2', ':diffget 2<CR>', { noremap = true, silent = true, desc = 'diffget buffer 2' })
vim.keymap.set('n', '<leader>g3', ':diffget 3<CR>', { noremap = true, silent = true, desc = 'diffget buffer 3' })
vim.keymap.set('n', '<leader>g4', ':diffget 4<CR>', { noremap = true, silent = true, desc = 'diffget buffer 4' })

--lsp
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap=true, silent=true, desc = 'lsp go to definition' })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap=true, silent=true, desc = 'lsp go to implementation' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap=true, silent=true, desc = 'lsp hover docs' })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { noremap=true, silent=true, desc = 'lsp signature help' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { noremap=true, silent=true, desc = 'lsp rename symbol' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap=true, silent=true, desc = 'lsp show diagnostics' })
vim.keymap.set('n', '<leader>E', vim.lsp.buf.code_action, { noremap=true, silent=true, desc = 'lsp code action' })

vim.keymap.set("n", "gr", function()
  require("telescope.builtin").lsp_references({
    show_line = false,
    include_declaration = false,
  })
end, { desc = 'lsp references' })

