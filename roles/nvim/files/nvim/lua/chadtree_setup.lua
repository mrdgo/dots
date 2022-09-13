vim.api.nvim_set_var("chadtree_settings", {
	keymap = {
		change_focus_up = { "h", "C" },
		change_dir = { "l", "c" },
		h_split = { "s" },
		v_split = { "v" },
		select = { "t" },
		new = { "n" },
	},
	options = {
		close_on_open = true,
	},
	view = {
		open_direction = "right",
		width = 50,
		window_options = {
			cursorline = true,
			number = false,
			relativenumber = true,
			signcolumn = "no",
			winfixwidth = true,
			wrap = false,
		},
	},
})

vim.keymap.set("n", "<Leader>ut", "<cmd>CHADopen<CR>", {})
