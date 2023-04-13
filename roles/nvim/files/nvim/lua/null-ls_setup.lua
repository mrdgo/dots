local null_ls = require("null-ls")
local diagnostics_format = "[#{c}] #{m} (#{s})"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		require("lsp_on_attach").on_attach()
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
	sources = {
		-- refactoring.nvim code_actions,
		code_actions.refactoring,
		-- shellcheck code_actions,
		code_actions.shellcheck,
		-- gitrebase code_actions,
		code_actions.gitrebase,
		-- lua
		formatting.stylua.with({
			condition = function(utils)
				return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
			end,
		}),
		-- json
		formatting.fixjson,
		-- yaml
		diagnostics.yamllint.with({
			diagnostics_format = diagnostics_format,
			extra_args = { "-d", "{extends: default, rules: {line-length: {max: 100}}}" },
		}),
		-- markdown
		diagnostics.write_good.with({ filetypes = { "markdown", "tex" } }),
		diagnostics.markdownlint.with({
			diagnostics_format = diagnostics_format,
		}),
		-- python
		formatting.black,
		-- diagnostics.vulture,
		-- sql
		formatting.sqlformat,
		-- toml
		formatting.taplo,
		-- css/scss/sass/less
		formatting.stylelint,
		formatting.prettierd.with({ filetypes = { "scss", "typescript", "javascript" } }),
		formatting.eslint_d.with({ filetypes = { "typescript", "javascript" } }),
	},
})
