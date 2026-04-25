require('options')
require('keymappings')

require('plugins.catppuccin') --color scheme
require('plugins.nvim-treesitter') --manages tree-sitter parsers (syntax highlighting)
require('plugins.nvim-colorizer') --show colors (hex etc)

require('plugins.nvim-ufo') --code folding
require('plugins.vim-matchup') --better matching (especially for html)
require('plugins.markdown-preview') --browser preview for md
require('plugins.gitsigns') --only using for quick diff (<leader>gD)

require('netrw') --builtin file manager
require('plugins.telescope') --various finders (grep, files, references etc.)
require('plugins.harpoon') --quick switch files

require('plugins.mason') --external tools plugin manager (lsp, dap etc)
require('plugins.vim-illuminate') --highlight word references under cursor
require('plugins.lspconfig') --premade configs for lsp

require('plugins.lsp_signiture') --signiture help
require('plugins.cmp') --completion
require('plugins.jdtls') --java tools (debugger, lsp, tests, etc.)

require('plugins.nvim-dap') --debug adapter
require('plugins.dap-python') --debug adapter for python
require('plugins.nvim-dap-ui') --ui for dap
require('plugins.neotest') --tests, only configured for java atm
