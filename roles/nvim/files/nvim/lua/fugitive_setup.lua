local map = function(key, cmd)
    vim.api.nvim_set_keymap(
      'n', '<Leader>'..key, '<cmd>'..cmd..'<CR>', { noremap=true, silent=false })
end
local gmap = function(key, cmd) map('g'..key, 'G '..cmd) end

gmap('s', '')
gmap('a', 'add %')
gmap('d', 'diff %')
gmap('c', 'commit')
gmap('p', 'push')
gmap('u', 'pull')
gmap('n', 'rebase --continue')

map('gh', 'diffget //2')
map('gt', 'diffget //3')
