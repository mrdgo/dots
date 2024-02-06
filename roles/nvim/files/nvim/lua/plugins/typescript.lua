return {
	"jose-elias-alvarez/typescript.nvim",
	ft = "typescript",
	keys = function()
		return {
			{
				"<Leader>smi",
				require("typescript").actions.addMissingImports,
				desc = "ts: Add missing imports",
			},
			{
				"<Leader>soi",
				require("typescript").actions.organizeImports,
				desc = "ts: organize imports",
			},
			{
				"<Leader>sF",
				require("typescript").actions.fixAll,
				desc = "ts: fix all",
			},
			{
				"<Leader>su",
				require("typescript").actions.removeUnused,
				desc = "ts: remove unused",
			},
			{ "<Leader>str", "<cmd>TypescriptRenameFile<CR>", desc = "ts: rename file" },
		}
	end,
	config = true,
	opts = {
		disable_commands = true, -- prevent the plugin from creating Vim commands
		debug = false, -- enable debug logging for commands
		server = { -- pass options to lspconfig's setup method
			on_attach = require("lsp_on_attach").on_attach,
		},
	},
}
