local function on_attach(a, bufnr)
	require("lsp_signature").on_attach(a, bufnr)
	--require'virtualtypes'.on_attach(a, bufnr)

	local vim = vim
	local telescope = require("telescope.builtin")
	local keymaps = {
		A = vim.lsp.code_action,
		k = vim.lsp.hover,
		D = vim.lsp.declaration,
		S = vim.lsp.signature_help,
		t = vim.lsp.type_definition,
		R = vim.lsp.rename,
		f = vim.lsp.formatting,
		a = vim.diagnostic.open_float,
		n = vim.diagnostic.goto_next,
		p = vim.diagnostic.goto_prev,
		g = telescope.lsp_document_diagnostics,
		i = telescope.lsp_implementations,
		d = telescope.lsp_definitions,
		y = telescope.lsp_document_symbols,
	}

	for key, func in pairs(keymaps) do
		vim.keymap.set("n", "<Leader>s" .. key, func, { silent = true })
	end
end

return {
	on_attach = on_attach,
}
