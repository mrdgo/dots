local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.api.nvim_set_keymap("n", "<Leader>pu", "<cmd>Lazy<cr>", { noremap = true, silent = true })

-- TODO: look at https://github.com/miversen33/netman.nvim
