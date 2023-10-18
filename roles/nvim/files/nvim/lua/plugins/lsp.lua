return {
	"neovim/nvim-lspconfig",
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
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
