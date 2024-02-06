return {
	"mrcjkb/rustaceanvim",
	version = "^3", -- Recommended
	ft = { "rust" },
	config = function()
		vim.g.rustaceanvim = {
			server = {
				settings = {
					["rust-analyzer"] = { rustcSource = "discover" },
				},
				on_attach = function()
					require("lsp_on_attach").on_attach()
					vim.keymap.set({ "v", "n" }, "<Leader>sa", vim.lsp.buf.code_action)
					vim.keymap.set("n", "<Leader>sh", function()
						vim.cmd.RustLsp({ "view", "hir" })
					end)
					vim.keymap.set("n", "<Leader>sm", function()
						vim.cmd.RustLsp({ "view", "mir" })
					end)

					vim.keymap.set("n", "J", function()
						vim.cmd.RustLsp("joinLines")
					end)
				end,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			},
		}
	end,
}
