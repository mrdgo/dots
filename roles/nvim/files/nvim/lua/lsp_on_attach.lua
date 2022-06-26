local function on_attach(a, bufnr)
	require("lsp_signature").on_attach(a, bufnr)
	--require'virtualtypes'.on_attach(a, bufnr)

	local keymaps = {
		["lsp.buf"] = {
			A = "code_action()",
			k = "hover()",
			D = "declaration()",
			S = "signature_help()",
			t = "type_definition()",
			R = "rename()",
			f = "formatting()",
		},
		diagnostic = {
			a = "open_float()",
			n = "goto_next()",
			p = "goto_prev()",
		},
	}

	local telescope_maps = {
		g = "lsp_document_diagnostics()",
		i = "lsp_implementations()",
		d = "lsp_definitions()",
		y = "lsp_document_symbols()",
	}

	local opts = { noremap = false, silent = true }

	local map = function(key, cmd)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>s" .. key, "<cmd>lua " .. cmd .. "<CR>", opts)
	end

	for space, maps in pairs(keymaps) do
		for key, cmd in pairs(maps) do
			map(key, "vim." .. space .. "." .. cmd)
		end
	end

	for key, cmd in pairs(telescope_maps) do
		map(key, 'require"telescope.builtin".' .. cmd)
	end
end

return {
	on_attach = on_attach,
}
