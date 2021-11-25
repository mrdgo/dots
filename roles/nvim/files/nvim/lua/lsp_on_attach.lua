return {
	on_attach = function(a, bufnr)
		require("lsp_signature").on_attach(a, bufnr)
		--require'virtualtypes'.on_attach(a, bufnr)

		local opts = { noremap = false, silent = true }

		local map = function(key, cmd)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>s" .. key, "<cmd>lua " .. cmd .. "<CR>", opts)
		end

		local map_lsp = function(key, cmd)
			map(key, "vim.lsp." .. cmd)
		end

		map_lsp("k", "buf.hover()")
		map_lsp("D", "buf.declaration()")
		-- map_lsp("d", "buf.definition()")
		-- map_lsp("i", "buf.implementation()")
		map_lsp("S", "buf.signature_help()")
		map_lsp("t", "buf.type_definition()")
		map_lsp("R", "buf.rename()")
		map_lsp("f", "buf.formatting()")
		map_lsp("a", "diagnostic.show_line_diagnostics()")
		map_lsp("n", "diagnostic.goto_next()")
		map_lsp("p", "diagnostic.goto_prev()")

		local map_tel = function(key, cmd)
			map(key, 'require"telescope.builtin".' .. cmd)
		end

		map_tel("r", "lsp_references()")
		map_tel("A", "lsp_code_actions()")
		map_tel("g", "lsp_document_diagnostics()")
		map_tel("i", "lsp_implementations()")
		map_tel("d", "lsp_definitions()")
		map_tel("s", "lsp_document_symbols()")
	end,
}
