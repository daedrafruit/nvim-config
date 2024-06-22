local is_wsl = (os.getenv("WSL_DISTRO_NAME") ~= nil)
local home = os.getenv("HOME")

if is_wsl then
    package.path = package.path .. ";" .. home .. "/.config/nvim/lua/?.lua"
else
    package.path = package.path .. ";" .. home .. "/AppData/Local/nvim/lua/?.lua"
end

require('options')
require('keymappings')
require('netrw')

require('plugins.lazy')

require('plugins.lsp.mason')
require('plugins.lsp.lspconfig')
require('plugins.lsp.cmp')
require('plugins.nvim-treesitter')

require('plugins.nvim-dap')
require('plugins.nvim-dap-ui')

require('plugins.telescope')

require('plugins.themes.catpuccin')

