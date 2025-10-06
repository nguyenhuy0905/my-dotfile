local jdtls_pkg_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local proj_path = vim.fs.find({ ".git", "gradlew" }, {})

-- require("jdtls").start_or_attach({
--     cmd = {
--         "java",
--         -- copied from nvim-jdtls github page
--         "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--         "-Dosgi.bundles.defaultStartLevel=4",
--         "-Declipse.product=org.eclipse.jdt.ls.core.product",
--         "-Dlog.protocol=true",
--         "-Dlog.level=ALL",
--         "-Xmx1g",
--         "--add-modules=ALL-SYSTEM",
--         "--add-opens",
--         "java.base/java.util=ALL-UNNAMED",
--         "--add-opens",
--         "java.base/java.lang=ALL-UNNAMED",
--
--         "-jar",
--         jdtls_pkg_path
--             .. "/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar",
--         "-configuration",
--         jdtls_pkg_path .. "/config_linux",
--     },
--     root_dir = vim.fs.dirname(
--         vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]
--     ),
-- })
