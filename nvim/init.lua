--
--     ...      ('~')
--    (°з°)  _ ┐__\|_┌________ __   __ ___ __   __
--    |  |  | |       |       |  | |  |   |  |_|  |
--    |   |_| |    ___|  ___  |  |_|  |   |       |
--    |       |   |___| |▀-▀| |       |   |       |
--    |  _    |    ___| |___| |       |   |       |
--    | | |   |   |___|       ||     ||   | ||_|| |
--    |_|  |__|_______|_______| |___| |___|_|   |_|
--

local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
	if vim.fn.input("Hent packer.nvim? (y for yada)") ~= "y" then
		return
	end

	local directory = string.format(
	'%s/site/pack/packer/opt/',
	vim.fn.stdpath('data')
	)

	vim.fn.mkdir(directory, 'p')

	local git_clone_cmd = vim.fn.system(string.format(
	'git clone %s %s',
	'https://github.com/wbthomason/packer.nvim',
	directory .. '/packer.nvim'
	))

	print(git_clone_cmd)
	print("Henter packer.nvim...")

	return
end

require'leader'
require'plugins'

vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap=true})
vim.api.nvim_set_keymap('n', '<Leader>v', '<Cmd>e $MYVIMRC<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<Leader>r', '<Cmd>so $MYVIMRC<CR>', {noremap=false})

vim.cmd('source $HOME/.config/nvim/config/defaults.vim')
