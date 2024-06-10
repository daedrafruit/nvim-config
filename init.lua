package.path = package.path .. 'C:/Users/parke/AppData/Local/nvim/lua/?.lua'

require('options')
require('keymappings')

require('plugins.lazy')
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.nvim-treesitter')
require('plugins.lsp.mason')


require('plugins.lsp.lspconfig')
require('plugins.lsp.cmp')


vim.cmd.colorscheme "vscode"
