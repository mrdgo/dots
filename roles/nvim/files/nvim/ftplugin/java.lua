vim.o.colorcolumn = "140"

require("jdtls").start_or_attach({
	cmd = {
		"/usr/lib/jvm/java-11-openjdk/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"-Xmx2G",
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
		"/home/maxim/.jdt",
	},
	init_options = {
		bundles = {
			vim.fn.glob(
				"/opt/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.33.0.jar"
			),
		},
	},
	root_dir = require("jdtls.setup").find_root({ "mvnw", "pom.xml", ".git" }),
	settings = {
		java = {
			format = {
				settings = {
					url = " https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
				},
			},
		},
	},
	on_attach = function(a, bufnr)
		require("lsp_on_attach").on_attach(a, bufnr)

		require("jdtls").setup_dap({ hotcodereplace = "auto" })
		require("dap").configurations.java = {
			{
				type = "server",
				request = "attach",
				name = "Debug (Attach) - Remote",
				hostName = "127.0.0.1",
				port = 5005,
			},
		}
		require("jdtls.setup").add_commands()

		local opts = { noremap = false, silent = true }

		-- Java specific
		local map_jdt = function(key, cmd)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"<Leader>s" .. key,
				'<cmd>lua require"jdtls".' .. cmd .. "<CR>",
				opts
			)
		end

		map_jdt("oi", "organize_imports()")
		map_jdt("tc", "test_class()")
		map_jdt("tn", "test_nearest_method()")
		-- map_jdt("e", "extract_variable()")

		-- map_jdt("e", "extract_variable(true)")
		-- map_jdt("m", "extract_method(true)")
	end,
})
