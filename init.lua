-- load project specific .nvimrc or .vimrc files
vim.o.exrc = true
-- restrict unsafe commands in local configs
vim.o.secure = true
vim.env.PATH = vim.env.PATH .. ':' .. vim.fn.stdpath('data') .. '/mason/bin'

vim.o.winborder = "single"

require('options')
require('keymappings')

--color scheme
require('plugins.catppuccin')
require('plugins.nvim-treesitter')
--show colors (hex etc)
require('plugins.nvim-colorizer')
--code folding
require('plugins.nvim-ufo')
--better matching (especially for html)
require('plugins.vim-matchup')
require('plugins.markdown-preview')
require('plugins.gitsigns')

--file exploration
require('netrw')
require('plugins.telescope')
require('plugins.harpoon')
--external tools plugin manager (lsp, dap etc)
require('plugins.mason')
require('plugins.lspconfig')
--signiture help
require('plugins.lsp_signiture')
--completion
require('plugins.cmp')
require('plugins.friendly-snippets')
require('plugins.jdtls')

--debug adapter
require('plugins.nvim-dap')
require('plugins.dap-python')
require('plugins.nvim-dap-ui')
--tests
require('plugins.neotest')
