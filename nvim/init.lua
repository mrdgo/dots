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

require'leader'
vim.cmd'source $HOME/.config/nvim/config/defaults.vim'

require'plugins'
vim.cmd'source $HOME/.config/nvim/config/theme.vim'

vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap=true})
vim.api.nvim_set_keymap('n', '<Leader>v', '<Cmd>e $MYVIMRC<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<Leader>r', '<Cmd>so $MYVIMRC<CR>', {noremap=false})

