local nvim_lsp = require("lspconfig")

local servers = {
	"pylsp",
	"vimls",
	"texlab",
	"hls",
	"ccls",
	"tsserver",
	"html",
	"yamlls",
	"clojure_lsp",
	"sumneko_lua",
}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup(require("coq").lsp_ensure_capabilities({
		on_attach = require("lsp_on_attach").on_attach,
	}))
end

vim.cmd([[
sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=
]])

-- local lsPath = "/usr/lib/node_modules"
-- local cmd = { "ngserver", "--stdio", "--ngProbeLocations", lsPath, "--tsProbeLocations", lsPath }
-- require("lspconfig").angularls.setup(require("coq").lsp_ensure_capabilities({
-- 	on_attach = require("lsp_on_attach").on_attach,
-- 	cmd = cmd,
-- 	on_new_config = function(new_config, _)
-- 		new_config.cmd = cmd
-- 	end,
-- }))

local eslint_settings = {
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
}

nvim_lsp.eslint.setup(require("coq").lsp_ensure_capabilities({
	on_attach = require("lsp_on_attach").on_attach,
	settings = eslint_settings,
}))

return {
	setup_ansible = function()
		nvim_lsp.ansiblels.setup(require("coq").lsp_ensure_capabilities({
			on_attach = require("lsp_on_attach").on_attach,
		}))
	end,
}
