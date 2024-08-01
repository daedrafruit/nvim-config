local is_wsl = (os.getenv("WSL_DISTRO_NAME") ~= nil)
local home = os.getenv("HOME")

if is_wsl then
    package.path = package.path .. ";" .. home .. "/.config/nvim/lua/?.lua"
else
    package.path = package.path .. ";" .. home .. "/AppData/Local/nvim/lua/?.lua"
end

--stock
require('options')
require('keymappings')
--require('netrw') --file browser

--package mangagers
require('plugins.lazy')
require('plugins.lsp.mason')

--theme
require('plugins.themes.catpuccin')

--fuzzy finder and grep
require('plugins.telescope')
require('plugins.nvim-tree')

--language server protocol config
require('plugins.lsp.lspconfig')
require('plugins.lsp.cmp') --auto complete
require('plugins.nvim-treesitter') --syntax highlighting

--code fold
require('plugins.toggleterm')

--debugger
require('plugins.nvim-dap')
require('plugins.nvim-dap-ui')

--terminal 
require('plugins.toggleterm')

--code fold 
require('plugins.nvim-ufo')


