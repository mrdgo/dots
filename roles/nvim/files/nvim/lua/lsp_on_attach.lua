return {
	on_attach = function(a, bufnr)
		require("lsp_signature").on_attach(a, bufnr)
		--require'virtualtypes'.on_attach(a, bufnr)

		local opts = { noremap = false, silent = true }

		local map = function(key, cmd)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>s" .. key, "<cmd>lua " .. cmd .. "<CR>", opts)
		end

		local map_lsp = function(key, cmd)
			map(key, "vim." .. cmd)
		end

		map_lsp("A", "lsp.buf.code_action()")
		map_lsp("k", "lsp.buf.hover()")
		map_lsp("D", "lsp.buf.declaration()")
		-- map_lsp("d", "lsp.buf.definition()")
		-- map_lsp("i", "lsp.buf.implementation()")
		map_lsp("S", "lsp.buf.signature_help()")
		map_lsp("t", "lsp.buf.type_definition()")
		map_lsp("R", "lsp.buf.rename()")
		map_lsp("f", "lsp.buf.formatting()")

		map_lsp("a", "diagnostic.open_float()")
		map_lsp("n", "diagnostic.goto_next()")
		map_lsp("p", "diagnostic.goto_prev()")

		local map_tel = function(key, cmd)
			map(key, 'require"telescope.builtin".' .. cmd)
		end

		map("A", "vim.lsp.buf.code_action()")

		map_tel("g", "lsp_document_diagnostics()")
		map_tel("i", "lsp_implementations()")
		map_tel("d", "lsp_definitions()")
		map_tel("y", "lsp_document_symbols()")
	end,
}
