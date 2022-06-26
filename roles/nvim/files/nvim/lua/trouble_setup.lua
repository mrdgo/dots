require("trouble").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
})

local leader = "<leader>s"
local maps = {
	s = "",
	w = "workspace_diagnostics",
	D = "document_diagnostics",
	l = "loclist",
	q = "quickfix",
	r = "lsp_references",
}

for k, v in pairs(maps) do
	vim.api.nvim_set_keymap("n", leader .. k, "<cmd>Trouble" .. v .. " <cr>", { silent = true, noremap = true })
end
