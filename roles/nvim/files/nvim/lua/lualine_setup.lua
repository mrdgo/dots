require("lualine").setup({
	options = {
		theme = "gruvbox-baby",
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
		lualine_x = {},
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
	},
})
