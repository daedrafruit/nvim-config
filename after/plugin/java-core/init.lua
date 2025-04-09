-- this file removed the javaagent argument from java-core init if it does not find the corresponding mason package
local jdtls_server = require('java-core.ls.servers.jdtls')
jdtls_server.get_config_original = jdtls_server.get_config

local mason_reg = require('mason-registry')

jdtls_server.get_config = function(opts)
    local config = jdtls_server.get_config_original(opts)
		local lombok = mason_reg.get_package('lombok-nightly')
  
		if config.cmd and not lombok:is_installed() then
        config.cmd = vim.tbl_filter(function(arg)
            return not arg:match("-javaagent:")
        end, config.cmd)
				print('lombok-nightly is not installed. Removing -javaagent configuration.')
    end

    return config
end
