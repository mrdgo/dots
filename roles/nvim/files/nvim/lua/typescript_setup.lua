local on_attach = function(a, bufnr)
	require("lsp_on_attach").on_attach(a, bufnr)

	local opts = { exit = true, nowait = true }
	local tss = require("typescript").actions
	local keymaps = {
		{ "mi", tss.addMissingImports, opts },
		{ "oi", tss.organizeImports, opts },
		{ "F", tss.fixAll, opts },
		{ "u", tss.removeUnused, opts },
		{ "tr", "<cmd>TypescriptRenameFile<CR>", opts },
	}

	for _, tbl in ipairs(keymaps) do
		vim.keymap.set("n", "<Leader>s" .. tbl[1], tbl[2])
	end
end

return { on_attach = on_attach }
