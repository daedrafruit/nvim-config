
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local mason_registry = require("mason-registry")

local ensure_installed = {
	"clangd",
	"cpptools", 		
}

for _, tool in ipairs(ensure_installed) do
    local package = mason_registry.get_package(tool)
    if not package:is_installed() then
        package:install()
    end
end
