local null_ls = require("null-ls")
local nutils = require("null-ls.utils")
local nhelpers = require("null-ls.helpers")
local diagnostics_format = "[#{c}] #{m} (#{s})"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local capabilities = require("cmp_nvim_lsp").default_capabilities()

null_ls.setup({
	capabilities = capabilities,
	on_attach = require("lsp_on_attach").on_attach,
	sources = {
		-- refactoring.nvim code_actions,
		code_actions.refactoring,
		-- shellcheck code_actions,
		code_actions.shellcheck,
		-- gitrebase code_actions,
		code_actions.gitrebase,
		-- python
		diagnostics.flake8.with({
			diagnostics_format = diagnostics_format,
			prefer_local = ".tox/py38-test/bin",
			cwd = nhelpers.cache.by_bufnr(function(params)
				return nutils.root_pattern(
					".flake8",
					"pyproject.toml",
					"setup.py",
					"setup.cfg",
					"requirements.txt",
					"Pipfile",
					"pyrightconfig.json"
				)(params.bufname)
			end),
			extra_args = { "--extend-ignore", "E1,E2,E3,E402,F821,E731,R504,SIM106" },
		}),
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
		diagnostics.markdownlint.with({
			diagnostics_format = diagnostics_format,
		}),
		-- sql
		formatting.sqlformat,
		-- toml
		formatting.taplo,
		-- css/scss/sass/less
		formatting.stylelint,
	},
})
