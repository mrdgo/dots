return {
	"lervag/vimtex",
	config = function()
		-- Viewer options: One may configure the viewer either by specifying a built-in
		-- viewer method:
		vim.api.nvim_set_var("vimtex_view_method", "zathura")
		vim.cmd("let g:vimtex_view_method = 'zathura'")

		-- Or with a generic interface:
		vim.api.nvim_set_var("vimtex_view_general_viewer", "zathura")
		vim.api.nvim_set_var("vimtex_view_general_options", "--unique file:@pdf#src:@line@tex")

		-- VimTeX uses latexmk as the default compiler backend. If you use it, which is
		-- strongly recommended, you probably don't need to configure anything. If you
		-- want another compiler backend, you can change it as follows. The list of
		-- supported backends and further explanation is provided in the documentation,
		-- see ":help vimtex-compiler".
		-- vim.g.vimtex_compiler_method = "tectonic"
		vim.api.nvim_set_var("vimtex_compiler_method", "tectonic")
		vim.cmd([[
            let g:vimtex_compiler_method = "tectonic"
        ]])

		-- Most VimTeX mappings rely on localleader and this can be changed with the
		-- following line. The default is usually fine and is the symbol "\".
		vim.api.nvim_set_var("maplocalleader", ",")

		-- Highlight on yank
		local yankGrp = vim.api.nvim_create_augroup("Autobuild", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			command = "!tectonic %",
			pattern = "*.tex",
			group = yankGrp,
		})
	end,
	dependencies = {
		{ "evesdropper/luasnip-latex-snippets.nvim" },
	},
}
