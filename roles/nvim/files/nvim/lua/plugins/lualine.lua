return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opt = true },
		"WhoIsSethDaniel/lualine-lsp-progress",
		"chrisgrieser/nvim-recorder",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox",
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
				lualine_x = { require("recorder").displaySlots, "diff", "diagnostics", "searchcount" },
				lualine_y = { "lsp_progress", "filetype", "progress" },
				lualine_z = {
					{ require("recorder").recordingStatus, "location", left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{ "location" },
				},
			},
			tabline = {},
			extensions = {
				"quickfix",
				"chadtree",
				"toggleterm",
				"nvim-dap-ui",
			},
		})
	end,
}
