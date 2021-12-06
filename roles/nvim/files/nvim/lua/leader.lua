vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts_nore_silent = { noremap = true, silent = true }
local map = function(key, cmd)
	vim.api.nvim_set_keymap("n", "<Leader>" .. key, "<cmd>" .. cmd .. "<CR>", opts_nore_silent)
end

map("h", "wincmd h")
map("j", "wincmd j")
map("k", "wincmd k")
map("l", "wincmd l")

local opts_re_silent = { noremap = false, silent = true }
map("rh", "vertical resize +5")
map("rl", "vertical resize -5")
map("rj", "resize +5")
map("rk", "resize -5")

map("w", "update")
map("x", "x")
map("qq", "quitall")
map("qw", "q")

vim.api.nvim_set_keymap("v", "<Leader><Leader>", "<Esc>", opts_re_silent)

-- better next and join
vim.api.nvim_set_keymap("n", "n", "nzzzv", opts_re_silent)
vim.api.nvim_set_keymap("n", "N", "Nzzzv", opts_re_silent)
--vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', opts)

-- improve undo feeling
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", opts_re_silent)
vim.api.nvim_set_keymap("i", ",", ",<c-g>u", opts_re_silent)
vim.api.nvim_set_keymap("i", "?", "?<c-g>u", opts_re_silent)
vim.api.nvim_set_keymap("i", "!", "!<c-g>u", opts_re_silent)
--vim.api.nvim_set_keymap('i', " ", " <c-g>u", opts)

-- move lines/selection
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", opts_re_silent)
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", opts_re_silent)
vim.api.nvim_set_keymap("n", "<C-j>", ":m .+1<CR>==", opts_re_silent)
vim.api.nvim_set_keymap("n", "<C-k>", ":m .-2<CR>==", opts_re_silent)

-- map madness
vim.api.nvim_set_keymap("n", "<Leader>v", "<Cmd>e $MYVIMRC<CR>", { silent = true })

-- motions
vim.api.nvim_set_keymap("n", "gl", "$", opts_nore_silent)
vim.api.nvim_set_keymap("n", "gh", "^", opts_nore_silent)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>qf",
	"<cmd>lua for _, win in ipairs(vim.api.nvim_list_wins()) do local config = vim.api.nvim_win_get_config(win); if config.relative ~= '' then vim.api.nvim_win_close(win, false); print('Closing window', win) end end<CR>",
	opts_nore_silent
)
