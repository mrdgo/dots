local jdtls = require("jdtls")
local root_markers = { "gradlew", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)
local home = os.getenv("HOME")
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
-- :help vim.lsp.start_client` for an overview of the supported `config` options.

local bundles = {
	vim.fn.glob("/opt/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
}

vim.list_extend(bundles, vim.split(vim.fn.glob("/opt/vscode-java-test/server/*.jar"), "\n"))
-- vim.list_extend(bundles, vim.split(vim.fn.glob("/home/maxim/downloads/extensions/jars/*.jar"), "\n"))

local config = {
	cmd = {
		"/usr/lib/jvm/java-17-openjdk/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:/home/maxim/.config/nvim/config/lombok.jar",
		"-jar",
		"/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",
		"/usr/share/java/jdtls/config_linux",
		"-data",
		workspace_folder,
	},
	root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew" }),
	settings = {
		java = {
			format = {
				settings = {
					url = " https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
				},
			},
		},
	},
	init_options = {
		bundles = bundles,
	},
	on_attach = function(a, bufnr)
		require("lsp_on_attach").on_attach(a, bufnr)

		jdtls.setup_dap({ hotcodereplace = "auto" })
		require("dap").configurations.java = {
			{
				type = "server",
				request = "attach",
				name = "Debug (Attach) - Remote",
				hostName = "127.0.0.1",
				port = 5005,
			},
		}
		jdtls.setup.add_commands()

		local jdt_maps = {
			oi = jdtls.organize_imports,
			ct = jdtls.test_class,
			nt = jdtls.test_nearest_method,
			-- e = "extract_variable(true)"
			-- m = "extract_method(true)"
		}

		-- Java specific
		for key, cmd in pairs(jdt_maps) do
			vim.keymap.set("n", "<Leader>s" .. key, cmd, { noremap = false, silent = true })
		end
	end,
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)

-- vim.lsp.start({
-- 	name = "sonarlint",
-- 	cmd = function(...)
-- 		os.execute(
-- 			"/usr/lib/jvm/java-11-openjdk/bin/java /opt/sonarlint-language-server/target/sonarlint-language-server-2.13.0-SNAPSHOT.jar 5055 -analyzers /opt/sonarlint-language-server/target/plugins/sonarjava.jar"
-- 		)
-- 		return vim.lsp.rpc.connect("127.0.0.1", 5055)(...)
-- 	end,
-- 	-- "/opt/sonarlint-language-server/target/...",
-- 	root_dir = vim.fs.dirname(vim.fs.find({ "pom.xml" }, { upward = true })[1]),
-- })
