vim.api.nvim_set_var("chadtree_settings", {
	keymap = {
		change_focus_up = { "h", "C" },
		change_dir = { "l", "c" },
		h_split = { "s" },
		v_split = { "v" },
		select = { "<Space>" },
		new = { "n" },
	},
	options = {
		close_on_open = true,
	},
	theme = {
		text_colour_set = "env",
		discrete_colour_map = {
			black = "#282828",
			red = "#cc241d",
			green = "#98971a",
			yellow = "#d79921",
			blue = "#458588",
			magenta = "#b16286",
			cyan = "#689d6a",
			white = "#ebdbb2",

			bright_black = "#928374",
			bright_red = "#fb4934",
			bright_green = "#b8bb26",
			bright_yellow = "#fabd2f",
			bright_blue = "#83a598",
			bright_magenta = "#d3869b",
			bright_cyan = "#8ec07c",
			bright_white = "#f9f5d7",
		},
	},
	view = {
		open_direction = "right",
		width = 50,
	},
})

vim.api.nvim_set_keymap("n", "<Leader>ut", "<cmd>CHADopen<CR>", {})
