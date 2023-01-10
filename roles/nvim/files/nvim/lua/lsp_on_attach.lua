local function on_attach()
	local telescope = require("telescope.builtin")
	local goto_prev = require("goto-preview")
	local opts = { exit = true, nowait = true }

	local keymaps = {
		{ "a", vim.lsp.buf.code_action, opts },
		{ "A", vim.diagnostic.open_float, opts },
		{ "k", vim.lsp.buf.hover, opts },
		{ "i", telescope.lsp_implementations, opts },
		{ "d", vim.lsp.buf.definition, opts },
		{ "D", vim.lsp.buf.declaration, opts },
		{ "t", vim.lsp.buf.type_definition, opts },
		{ "fi", goto_prev.goto_preview_implementation, opts },
		{ "fd", goto_prev.goto_preview_definition, opts },
		{ "ft", goto_prev.goto_type_definition, opts },
		{ "fq", goto_prev.close_all_win, opts },
		{ "w", vim.diagnostic.setqflist, opts }, -- workspace diagnostics
		{ "S", vim.lsp.buf.signature_help, opts },
		{ "R", vim.lsp.buf.rename, opts },
		{ "r", vim.lsp.buf.references, opts },
		{
			"ff",
			function()
				vim.lsp.buf.format({ async = true })
			end,
			opts,
		},
		{ "P", vim.diagnostic.goto_next, opts },
		{ "p", vim.diagnostic.goto_prev, opts },
		{ "g", telescope.diagnostics, opts },
		{ "y", telescope.lsp_document_symbols, opts },
		-- { "<Esc>", nil, opts },
	}

	-- require("hydra")({
	-- 	name = "LSP",
	-- 	mode = "n",
	-- 	body = "<Leader>s",
	-- 	heads = keymaps,
	-- })

	for _, tbl in ipairs(keymaps) do
		vim.keymap.set("n", "<Leader>s" .. tbl[1], "", { callback = tbl[2] })
	end
end

return { on_attach = on_attach }
