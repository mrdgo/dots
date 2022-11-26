local c = require("gruvbox-baby.colors").config()
local bg_desired = "#161616"

local theme = {
	normal = {
		a = { bg = c.light_blue, fg = c.dark, gui = "bold" },
		b = { bg = bg_desired, fg = c.light_blue },
		c = { bg = bg_desired, fg = c.milk },
	},
	insert = {
		a = { bg = c.bright_yellow, fg = c.dark, gui = "bold" },
		b = { bg = bg_desired, fg = c.bright_yellow },
		c = { bg = bg_desired, fg = c.milk },
	},
	visual = {
		a = { bg = c.milk, fg = c.dark, gui = "bold" },
		b = { bg = bg_desired, fg = c.milk },
		c = { bg = bg_desired, fg = c.milk },
	},
	replace = {
		a = { bg = c.error_red, fg = c.dark, gui = "bold" },
		b = { bg = bg_desired, fg = c.error_red },
		c = { bg = bg_desired, fg = c.milk },
	},
	command = {
		a = { bg = c.soft_green, fg = c.dark, gui = "bold" },
		b = { bg = bg_desired, fg = c.soft_green },
		c = { bg = bg_desired, fg = c.milk },
	},
	inactive = {
		a = { bg = bg_desired, fg = c.gray, gui = "bold" },
		b = { bg = bg_desired, fg = c.gray },
		c = { bg = bg_desired, fg = c.gray },
	},
}

require("lualine").setup({
	options = {
		theme = theme,
		component_separators = "|",
		section_separators = { left = "", right = "" },
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ "mode", right_padding = 2 },
		},
		lualine_b = { "filename", "branch" },
		lualine_c = { "fileformat" },
		lualine_x = { "diff", "diagnostics" },
		lualine_y = { "lsp_progress", "filetype", "progress" },
		lualine_z = {
			{ "location", left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {
		"quickfix",
		"chadtree",
		"toggleterm",
		"nvim-dap-ui",
	},
})
