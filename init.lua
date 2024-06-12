package.path = package.path .. '~/AppData/Local/nvim/lua/?.lua'

require('options')
require('keymappings')

require('plugins.lazy')
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.nvim-treesitter')
require('plugins.lsp.mason')

require('plugins.lsp.lspconfig')
require('plugins.lsp.cmp')

--require('plugins.themes.vscode')

require('plugins.themes.catpuccin')

--require('plugins.bufferline')

--require('plugins.feline')

