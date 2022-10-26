-- Example config in Lua
vim.g.gruvbox_baby_function_style = "bold"
vim.g.gruvbox_baby_keyword_style = "italic"
vim.g.gruvbox_baby_comment_style = "italic"
vim.g.gruvbox_baby_variable_style = "NONE"
vim.g.gruvbox_baby_background_color = "dark"

vim.g.gruvbox_baby_telescope_theme = 0
vim.g.gruvbox_baby_transparent_mode = 0

local c = require("gruvbox-baby.colors").config(require("gruvbox-baby.config"))
vim.g.gruvbox_baby_highlights = {
	TelescopeBorder = { bg = c.dark },

	TelescopePromptTitle = { fg = c.dark, bg = c.soft_green },
	TelescopePromptCounter = { fg = c.milk, bg = c.background_light },
	TelescopePromptBorder = { bg = c.background_light },
	TelescopePromptNormal = { fg = c.milk, bg = c.background_light },
	TelescopePromptPrefix = { fg = c.soft_green, bg = c.background_light },

	TelescopePreviewTitle = { fg = c.soft_green, bg = c.background_light },
	TelescopePreviewNormal = { bg = c.dark },

	TelescopeResultsTitle = { fg = c.soft_green, bg = c.background_light },
	TelescopeResultsNormal = { bg = c.dark },

	TelescopeNormal = { bg = c.background_dark },
	TelescopeSelection = { bg = c.diff.change },
	LspSignatureActiveParameter = { fg = c.dark, bg = c.soft_green },
}

-- Load the colorscheme
vim.cmd([[colorscheme gruvbox-baby]])
vim.cmd([[set guifont=Mononoki=12]])
