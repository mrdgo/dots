return {
	"ellisonleao/gruvbox.nvim",
	config = function()
		vim.o.background = "dark" -- or "light" for light mode
		require("gruvbox").setup({
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				operators = true,
				comments = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			overrides = {
				["@variable"] = { fg = "#d5c4a1" },
				NoiceCmdlinePopupBorder = { bg = "#161616", fg = "#ebdbb2" },
				NoiceCmdlineIcon = { bg = "#161616", fg = "#7fa2ac" },
				Delimiter = { fg = "#fe8019" },
				-- TelescopeBorder = { bg = c.dark },
				-- TelescopePromptTitle = { fg = c.dark, bg = c.soft_green },
				-- TelescopePromptCounter = { fg = c.milk, bg = c.background_light },
				-- TelescopePromptBorder = { bg = c.background_light },
				-- TelescopePromptNormal = { fg = c.milk, bg = c.background_light },
				-- TelescopePromptPrefix = { fg = c.soft_green, bg = c.background_light },
				-- TelescopePreviewTitle = { fg = c.soft_green, bg = c.background_light },
				-- TelescopePreviewNormal = { bg = c.dark },
				-- TelescopeResultsTitle = { fg = c.soft_green, bg = c.background_light },
				-- TelescopeResultsNormal = { bg = c.dark },
				-- TelescopeNormal = { bg = c.background_dark },
				-- TelescopeSelection = { bg = c.diff.change },
			},
			dim_inactive = false,
			transparent_mode = false,
			palette_overrides = {
				dark0_hard = "#161616",
				bright_green = "#b8bb26",
			},
		})

		vim.cmd([[colorscheme gruvbox]])
		vim.cmd([[set guifont=Mononoki=12]])
	end,
}
