return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local jdtls = require("jdtls")

      local root_dir = require("jdtls.setup").find_root({
        "gradlew", "mvnw", "pom.xml", "build.gradle", ".git"
      })
      if root_dir == "" then return end

      local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspaces/"

      local jdtls_base = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
      local launcher = vim.fn.glob(jdtls_base .. "/plugins/org.eclipse.equinox.launcher_*.jar")

      local cmd = {
        "/usr/lib/jvm/java-21-openjdk/bin/java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "-Xmx2G",
        "-jar", launcher,
        "-configuration", jdtls_base .. "/config_linux",
        "-data", workspace_dir,
      }

			local mason = vim.fn.stdpath("data") .. "/mason"
			local dbg = vim.fn.glob(mason .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1)
      jdtls.start_or_attach({
        cmd = cmd,
        root_dir = root_dir,
				init_options = { 
					bundles = { dbg }, 
				},
      })
    end,
  },
}

