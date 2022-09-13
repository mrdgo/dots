require("projectmgr").setup({
	autogit = false,
	reopen = false,
	session = { enabled = true, file = ".session.vim" },
	shada = { enabled = false, file = "main.shada" },
	scripts = {
		enabled = true,
		file_startup = "startup.sh",
		file_shutdown = "shutdown.sh",
	},
})

vim.api.nvim_set_keymap("n", "<Leader>up", "<cmd>ProjectMgr<CR>", { noremap = true })

vim.api.nvim_set_keymap(
	"n",
	"<Leader>us",
	'<cmd>lua vim.ui.select(require("projectmgr.db_adapter").get_projects(), { prompt = "Projects" }, function(choice) print(choice) require("projectmgr.manage").open_project(choice) end)<CR>',
	{ noremap = true }
)
