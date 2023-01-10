return {
	"jose-elias-alvarez/typescript.nvim",
	ft = "typescript",
	keys = {
		{
			"<Leader>smi",
			function()
				require("typescript").actions.addMissingImports()
			end,
			desc = "ts: Add missing imports",
		},
		{
			"<Leader>soi",
			function()
				require("typescript").actions.organizeImports()
			end,
			desc = "ts: organize imports",
		},
		{
			"<Leader>sF",
			function()
				require("typescript").actions.fixAll()
			end,
			desc = "ts: fix all",
		},
		{
			"<Leader>su",
			function()
				require("typescript").actions.removeUnused()
			end,
			desc = "ts: remove unused",
		},
		{ "<Leader>str", "<cmd>TypescriptRenameFile<CR>", desc = "ts: rename file" },
	},
	config = true,
	opts = {
		disable_commands = true, -- prevent the plugin from creating Vim commands
		debug = false, -- enable debug logging for commands
		server = { -- pass options to lspconfig's setup method
			on_attach = require("lsp_on_attach").on_attach,
		},
	},
}
