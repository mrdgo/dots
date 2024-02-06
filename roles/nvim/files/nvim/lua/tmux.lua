local au_id = vim.api.nvim_create_augroup("TmuxStatus", { clear = true })

vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained" }, {
	pattern = "*",
	group = au_id,
	command = "!tmux set status off",
})

vim.api.nvim_create_autocmd({ "VimLeave", "FocusLost" }, {
	pattern = "*",
	group = au_id,
	command = "!tmux set status",
})
