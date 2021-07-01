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

local opts = { noremap=false, silent=true }
map('rh', 'vertical resize +5')
map('rl', 'vertical resize -5')
map('rj', 'resize +5')
map('rk', 'resize -5')

map('w', 'w')
map('x', 'x')
map('q', 'q')

map('ss', 'SSave')  -- startify
map('sc', 'SClose')  -- startify

-- fugitive
local gmap = function(key, cmd)
    vim.api.nvim_set_keymap(
      'n', '<Leader>g'..key,
      '<cmd>G '..cmd..'<CR>', opts
    )
end

gmap('', '')
gmap('a', 'add %')
gmap('d', 'diff %')
gmap('c', 'commit')
gmap('p', 'push')
gmap('u', 'pull')

map('gh', 'diffget //2')
map('gs', 'diffget //3')
