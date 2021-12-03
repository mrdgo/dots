vim.o.colorcolumn = "140"

require("jdtls").start_or_attach({
	cmd = { "eclipse.jdt.ls" },
	init_options = {
		bundles = {
			vim.fn.glob("/opt/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
		},
	},
	root_dir = require("jdtls.setup").find_root({ "gradle.build", "pom.xml" }),
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

-- require"dap_java"
