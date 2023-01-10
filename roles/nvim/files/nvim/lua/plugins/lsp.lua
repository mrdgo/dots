return {
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp_setup")
			require("null-ls_setup")
		end,
		dependencies = {
			{ "mfussenegger/nvim-jdtls" },
			{ "onsails/lspkind-nvim" },
			{ "nvim-tree/nvim-web-devicons" },
			{ "ray-x/lsp_signature.nvim" },
			{ "folke/lsp-colors.nvim" },
			{ "nvim-telescope/telescope.nvim" },
			{ "jose-elias-alvarez/null-ls.nvim" },
		},
	}
