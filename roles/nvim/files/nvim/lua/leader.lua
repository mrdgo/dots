vim.g.mapleader = " "

local opts = { noremap=true, silent=true }
local map = function(key, cmd)
    vim.api.nvim_set_keymap(
      'n', '<Leader>'..key,
      '<cmd>'..cmd..'<CR>', opts
    )
end

map('h', 'wincmd h')
map('j', 'wincmd j')
map('k', 'wincmd k')
map('l', 'wincmd l')

local opts_nore = { noremap=false, silent=true }
map('rh', 'vertical resize +5')
map('rl', 'vertical resize -5')
map('rj', 'resize +5')
map('rk', 'resize -5')

map('w', 'w')
map('x', 'x')
map('q', 'q')

map('ss', 'SSave')  -- startify
map('sc', 'SClose')  -- startify

vim.api.nvim_set_keymap('v', '<Leader><Leader>', '<Esc>', opts_nore)

-- better next and join
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', opts_nore)
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', opts_nore)
--vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', opts)

-- improve undo feeling
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', opts_nore)
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', opts_nore)
vim.api.nvim_set_keymap('i', '?', '?<c-g>u', opts_nore)
vim.api.nvim_set_keymap('i', '!', '!<c-g>u', opts_nore)
--vim.api.nvim_set_keymap('i', " ", " <c-g>u", opts)

-- move lines/selection
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", opts_nore)
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", opts_nore)
vim.api.nvim_set_keymap('n', '<C-j>', ':m .+1<CR>==', opts_nore)
vim.api.nvim_set_keymap('n', '<C-k>', ':m .-2<CR>==', opts_nore)

-- map madness
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap=true})
vim.api.nvim_set_keymap('n', '<Leader>v', '<Cmd>e $MYVIMRC<CR>', {silent=true})
