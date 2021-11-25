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

-- vim.cmd[[scriptencoding utf-8]]

vim.o.termguicolors = true
vim.cmd("source $HOME/.config/nvim/config/defaults.vim")

-- shot on luafication of defaults
require("defaults")

require("leader")

require("plugins")

-- <Leader>W saves file as root
require("doas").setup()
require("whitespace")

-- local async
-- async =vim.loop.new_async(
--     vim.schedule_wrap(
--     function()
--         require'leader'
--
--         require'plugins'
--         vim.cmd'source $HOME/.config/nvim/config/theme.vim'
--
--         async:close()
--     end
--     )
-- )
--
-- async:send()
