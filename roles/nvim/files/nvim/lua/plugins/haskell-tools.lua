return {
	"MrcJkb/haskell-tools.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	ft = "haskell",
	keys = function()
		return {
			{ "<Leader>sc", vim.lsp.codelens.run },
			{
				"<Leader>sh",
				require("haskell-tools").hoogle.hoogle_signature,
			},
		}
	end,
	config = true,
	opts = {
		hls = {
			on_attach = function()
				require("lsp_on_attach").on_attach()
			end,
		},
	},
}
