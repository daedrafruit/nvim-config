-- this file overrides the mason-dep funtion in nvim-java that is responsible for creating the list of mason packages to install
-- this makes it so that when a feature is not enabled, the corresponding packages will not install
local List = require('java-core.utils.list')
local mason_dep = require('java.startup.mason-dep')

mason_dep.get_pkg_list = function(config)
    local deps = List:new({
        { name = 'jdtls', version = config.jdtls.version },
    })

    if config.lombok.enabled then
        deps:push({ name = 'lombok-nightly', version = config.lombok.version })
    end

    if config.java_test.enabled then
        deps:push({ name = 'java-test', version = config.java_test.version })
    end

    if config.java_debug_adapter.enabled then
        deps:push({ name = 'java-debug-adapter', version = config.java_debug_adapter.version })
    end

    if config.jdk.auto_install then
        deps:push({ name = 'openjdk-17', version = config.jdk.version })
    end

    if config.spring_boot_tools.enable then
        deps:push({ name = 'spring-boot-tools', version = config.spring_boot_tools.version })
    end

    return deps
end
