--
--     ...      ('~')
--    (°з°)  _ ┐__\|_┌________ __   __ ___ __   __
--    |  |  | |       |       |  | |  |   |  |_|  |
--    |   |_| |    ___|  ___  |  |_|  |   |       |
--    |       |   |___| |▀-▀| |       |   |       |
--    |  _    |    ___| |___| |       |   |       |
--    | | |   |   |___|       ||     ||   | ||_|| |
--    |_|  |__|_______|_______| |___| |___|_|   |_|

vim.g.loaded_man = false
vim.g.loaded_gzip = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false

vim.cmd'source $HOME/.config/nvim/config/defaults.vim'

-- unsuccessfull shot on luafication of defaults
-- require'defaults'

require'leader'

require'plugins'

-- local async
-- async =vim.loop.new_async(
--     vim.schedule_wrap(
--     function()
--         require'leader'
--
--         require'plugins'
--         vim.cmd'source $HOME/.config/nvim/config/theme.vim'
--
--         vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap=true})
--         vim.api.nvim_set_keymap('n', '<Leader>v', '<Cmd>e $MYVIMRC<CR>', {silent=true})
--         vim.api.nvim_set_keymap('n', '<Leader>r', '<Cmd>so $MYVIMRC<CR>', {noremap=false})
--         async:close()
--     end
--     )
-- )
--
-- async:send()
