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

local config = {
	cmd = {
		"jdtls",
		"--jvm-arg=-javaagent:" .. home .. "/.config/nvim/config/lombok.jar",

		-- "/usr/lib/jvm/java-17-openjdk/bin/java",
		-- "-Declipse.application=org.eclipse.jdt.ls.core.id1",
		-- "-Dosgi.bundles.defaultStartLevel=4",
		-- "-Declipse.product=org.eclipse.jdt.ls.core.product",
		-- "-Dlog.protocol=true",
		-- "-Dlog.level=ALL",
		-- "-Xms1g",
		-- "--add-modules=ALL-SYSTEM",
		-- "--add-opens",
		-- "java.base/java.util=ALL-UNNAMED",
		-- "--add-opens",
		-- "java.base/java.lang=ALL-UNNAMED",
		-- "-javaagent:" .. home .. "/.config/nvim/config/lombok.jar",
		-- "-jar",
		-- "/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar",
		-- "-configuration",
		-- "/usr/share/java/jdtls/config_linux",
		-- "-data",
		-- workspace_folder,
	},
	root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew" }),
	settings = {
		java = {
			signatureHelp = { enabled = true },
			format = {
				settings = {
					url = " https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
				},
			},
			configuration = {
				-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
				-- And search for `interface RuntimeOption`
				-- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
				runtimes = {
					{
						name = "JavaSE-17",
						path = "/usr/lib/jvm/java-17-openjdk/",
					},
					{
						name = "JavaSE-21",
						path = "/usr/lib/jvm/java-21-openjdk/",
					},
				},
			},
		},
	},
	init_options = {
		bundles = bundles,
	},
	on_attach = function()
		require("lsp_on_attach").on_attach()

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
