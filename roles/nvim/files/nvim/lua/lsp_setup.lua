local nvim_lsp = require("lspconfig")

local servers = {
	"pylsp",
	"vimls",
	"texlab",
	"ccls",
	"tsserver",
	"html",
	"clojure_lsp",
	"sumneko_lua",
}

-- TODO: play around with vim.lsp.'server'.start({})

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup(require("coq").lsp_ensure_capabilities({
		on_attach = require("lsp_on_attach").on_attach,
		settings = {
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
	}))
end

vim.cmd([[
sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=
]])

return {
	setup_ansible = function()
		nvim_lsp.ansiblels.setup(require("coq").lsp_ensure_capabilities({
			on_attach = require("lsp_on_attach").on_attach,
		}))
	end,
}
