local ht = require("haskell-tools")

ht.setup({
	hls = {
		-- See nvim-lspconfig's  suggested configuration for keymaps, etc.
		on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			-- haskell-language-server relies heavily on codeLenses,
			-- so auto-refresh (see advanced configuration) is enabled by default
			vim.keymap.set("n", "<space>sc", vim.lsp.codelens.run, opts)
			vim.keymap.set("n", "<space>sh", ht.hoogle.hoogle_signature, opts)
			-- default_on_attach(client, bufnr)  -- if defined, see nvim-lspconfig
			require("lsp_on_attach").on_attach(client, bufnr)
		end,
	},
})
