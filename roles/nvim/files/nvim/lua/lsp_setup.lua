local nvim_lsp = require("lspconfig")

local servers = {
	"elmls",
	"html",
	"kotlin_language_server",
	"pylsp",
	"robotframework_ls",
	"sumneko_lua",
	"texlab",
	"tsserver",
	"vimls",
}

-- TODO: play around with vim.lsp.'server'.start({})
-- Set up lspconfig.
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = {}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		capabilities = capabilities,
		on_attach = require("lsp_on_attach").on_attach,
		settings = {
			texlab = {
				auxDirectory = ".",
				bibtexFormatter = "texlab",
				build = {
					args = { "-etex", "%f" },
					executable = "xelatex",
					forwardSearchAfter = false,
					onSave = false,
				},
				chktex = {
					onEdit = false,
					onOpenAndSave = false,
				},
				diagnosticsDelay = 300,
				formatterLineLength = 80,
				forwardSearch = {
					args = {},
				},
				latexFormatter = "latexindent",
				latexindent = {
					modifyLineBreaks = false,
				},
			},
			yaml = {
				schemas = {
					["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yaml",
				},
			},
			eslint = {
				codeAction = {
					disableRuleComment = {
						enable = true,
						location = "separateLine",
					},
					showDocumentation = {
						enable = true,
					},
				},
				codeActionOnSave = {
					enable = true,
					mode = "all",
				},
				format = true,
				nodePath = "",
				onIgnoredFiles = "off",
				packageManager = "npm",
				quiet = false,
				rulesCustomizations = {},
				run = "onType",
				useESLintClass = false,
				validate = "on",
				workingDirectory = {
					mode = "auto",
				},
			},
		},
	})
end

vim.cmd([[
sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=
]])

return {
	setup_ansible = function()
		nvim_lsp.ansiblels.setup({
			capabilities = capabilities,
			on_attach = require("lsp_on_attach").on_attach,
		})
	end,
}
