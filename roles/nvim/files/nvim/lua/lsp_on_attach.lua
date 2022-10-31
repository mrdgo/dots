local function on_attach(a, bufnr)
	require("trouble").setup({
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	})

	local telescope = require("telescope.builtin")
	local goto_prev = require("goto-preview")
	local opts = { exit = true, nowait = true }
	local function trouble(command)
		return function()
			vim.cmd("TroubleToggle " .. command)
		end
	end

	local keymaps = {
		{ "a", vim.lsp.buf.code_action, opts },
		{ "A", vim.diagnostic.open_float, opts },
		{ "k", vim.lsp.buf.hover, opts },
		{ "i", telescope.lsp_implementations, opts },
		{ "d", vim.lsp.buf.definition, opts },
		{ "t", vim.lsp.buf.type_definition, opts },
		{ "fi", goto_prev.goto_preview_implementation, opts },
		{ "fd", goto_prev.goto_preview_definition, opts },
		{ "ft", goto_prev.goto_type_definition, opts },
		{ "fq", goto_prev.close_all_win, opts },
		-- { "D", vim.lsp.buf.declaration, opts },
		{ "D", trouble("document_diagnostics"), opts },
		{ "S", vim.lsp.buf.signature_help, opts },
		{ "R", vim.lsp.buf.rename, opts },
		{ "r", trouble("lsp_references"), opts },
		{ "f", vim.lsp.buf.formatting, opts },
		{ "n", vim.diagnostic.goto_next, opts },
		{ "p", vim.diagnostic.goto_prev, opts },
		{ "g", telescope.diagnostics, opts },
		{ "y", telescope.lsp_document_symbols, opts },
		{ "s", trouble(""), opts },
		{ "w", trouble("workspace_diagnostics"), opts },
		{ "l", trouble("loclist"), opts },
		{ "q", trouble("quickfix"), opts },
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
