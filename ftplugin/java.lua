local mason = vim.fn.stdpath("data") .. "/mason"
local root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw" }) or vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. project_name

local jdtls_base = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local launcher = vim.fn.glob(jdtls_base .. "/plugins/org.eclipse.equinox.launcher_*.jar")

local config = {
  name = "jdtls",

  cmd = {
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
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
  },

  init_options = {
    bundles = {
      vim.fn.glob(
        mason .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
        1
      )
    },
  },
}

require("jdtls").start_or_attach(config)
require("jdtls").setup_dap({ hotcodereplace = "auto" })
