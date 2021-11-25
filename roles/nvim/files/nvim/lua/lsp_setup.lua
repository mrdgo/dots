local nvim_lsp = require("lspconfig")

local servers = {
	"pylsp",
	"vimls",
	"texlab",
	"hls",
	"ccls",
	"tsserver",
	"html",
}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup(require("coq").lsp_ensure_capabilities({
		on_attach = require("lsp_on_attach").on_attach,
	}))
end

USER = vim.fn.expand("$USER")
local sumneko_root_path = "/home/maxim/.cache/nvim/lspconfig/sumneko_lua/lua-language-server"
local sumneko_binary = "/home/maxim/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server"

require("lspconfig").sumneko_lua.setup(require("coq").lsp_ensure_capabilities({
	on_attach = require("lsp_on_attach").on_attach,
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
}))

local lsPath = "/usr/lib/node_modules"
local cmd = { "ngserver", "--stdio", "--ngProbeLocations", lsPath, "--tsProbeLocations", lsPath }
require("lspconfig").angularls.setup(require("coq").lsp_ensure_capabilities({
	on_attach = require("lsp_on_attach").on_attach,
	cmd = cmd,
	on_new_config = function(new_config, _)
		new_config.cmd = cmd
	end,
}))

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
