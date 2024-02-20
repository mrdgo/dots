return {
	"neovim/nvim-lspconfig",
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
		require("mason-lspconfig").setup_handlers({
			function(server_name) -- default handler
				-- prepare nvim-cmp source
				local capabilities = require("cmp_nvim_lsp").default_capabilities()
				require("lspconfig")[server_name].setup({
					-- announce nvim-cmp-lsp capabilities to each lsp server
					capabilities = capabilities,
				})
			end,
		})
		require("lsp_setup")
	end,
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "williamboman/mason.nvim" },
		{ "simrat39/rust-tools.nvim" },
		{ "mfussenegger/nvim-jdtls" },
		{ "onsails/lspkind-nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "ray-x/lsp_signature.nvim" },
		{ "nvim-telescope/telescope.nvim" },
	},
}
