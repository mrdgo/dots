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
	"bugreport",
	"compiler",
	"ftplugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"man",
	"matchit",
	"netrw",
	"netrwFileHandlers",
	"netrwPlugin",
	"netrwSettings",
	"optwin",
	"rplugin",
	"rrhelper",
	"spellfile_plugin",
	"synmenu",
	"syntax",
	"tar",
	"tarPlugin",
	"tutor",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
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

require("plug")

-- <Leader>W saves file as root
require("doas").setup()
require("whitespace")
