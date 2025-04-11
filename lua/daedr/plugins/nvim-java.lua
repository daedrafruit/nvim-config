return {
  'nvim-java/nvim-java',
  ft = { 'java' },
  config = function()
    local mason_dep = require('java.startup.mason-dep')
    local List = require('java-core.utils.list')
    
    mason_dep.get_pkg_list = function(config)
      local deps = List:new({
        { name = 'jdtls', version = config.jdtls.version },
      })

      if config.lombok.enable then
        deps:push({ name = 'lombok-nightly', version = config.lombok.version })
      end

      if config.java_test.enable then
        deps:push({ name = 'java-test', version = config.java_test.version })
      end

      if config.java_debug_adapter.enable then
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

    local jdtls_server = require('java-core.ls.servers.jdtls')
    local mason_reg = require('mason-registry')
    
    jdtls_server.get_config_original = jdtls_server.get_config
    jdtls_server.get_config = function(opts)
      opts = opts or {}
      local config = jdtls_server.get_config_original(opts)
      
      if config.cmd then
        local lombok = mason_reg.get_package('lombok-nightly')
        if not lombok:is_installed() then
          config.cmd = vim.tbl_filter(function(arg)
            return not arg:match("-javaagent:")
          end, config.cmd)
					print("lombok-nightly is not installed. Removing -javaagent configuration.")
        end
      end
      
      return config
    end

    require('java').setup({
      java_test = {
        enable = false,
      },
      lombok = {
        enable = false,
      },
      spring_boot_tools = {
        enable = false,
      },
      java_debug_adapter = {
        enable = true,
      },
      jdk = {
        auto_install = true,
        version = '17.0.2',
      },
    })

    require('lspconfig').jdtls.setup({})
  end
}
