--stock
require('options')
require('keymappings')
--require('netrw') --file browser


--package mangagers
require('plugins.lazy') --plugins
require('plugins.lsp.mason') --lsp, debugger, etc

--theme
require('plugins.themes.catpuccin')

--session management
require('plugins.auto-session')


--terminal 
require('plugins.toggleterm')

--file browser
require('plugins.nvim-tree')
--fuzzy finder and grep
require('plugins.telescope')


--code fold 
--require('plugins.nvim-ufo')
--inline color previews
require('plugins.nvim-colorizer')


--language server protocol config
require('plugins.lsp.lspconfig')
require('plugins.lsp.cmp') --auto complete
require('plugins.nvim-treesitter') --syntax highlighting

--debugger
require('plugins.nvim-dap')
require('plugins.nvim-dap-ui')

--java is loaded by ftplugin/java.lua

