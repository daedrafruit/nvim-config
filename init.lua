-- load project specific .nvimrc or .vimrc files
vim.o.exrc = true
-- restrict unsafe commands in local configs
vim.o.secure = true

require('options')
require('keymappings')
--require('netrw') --file browser

--plugins
require('daedr.lazy')
