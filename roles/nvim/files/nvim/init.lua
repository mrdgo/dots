--
--     ...      ('~')
--    (°з°)  _ ┐__\|_┌________ __   __ ___ __   __
--    |  |  | |       |       |  | |  |   |  |_|  |
--    |   |_| |    ___|  ___  |  |_|  |   |       |
--    |       |   |___| |▀-▀| |       |   |       |
--    |  _    |    ___| |___| |       |   |       |
--    | | |   |   |___|       ||     ||   | ||_|| |
--    |_|  |__|_______|_______| |___| |___|_|   |_|

-- disable some builtin vim plugins
local default_plugins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"syntax",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
	"man",
}

for _, plugin in pairs(default_plugins) do
	vim.g["loaded_" .. plugin] = 1
end

vim.g.python3_host_prog = "/usr/bin/python"

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
