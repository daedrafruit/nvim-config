-- load project specific .nvimrc or .vimrc files
vim.o.exrc = true
-- restrict unsafe commands in local configs
vim.o.secure = true
vim.env.PATH = vim.env.PATH .. ':' .. vim.fn.stdpath('data') .. '/mason/bin'

require('options')
require('keymappings')
--require('netrw') --file browser

--plugins
require('daedr.lazy')
