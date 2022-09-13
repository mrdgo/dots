-- local function cmd(command)
-- 	return table.concat({ "<Cmd>", command, "<CR>" })
-- end

-- require("hydra")({
-- 	name = "Telescope",
-- 	config = {
-- 		color = "blue",
-- 		invoke_on_body = false,
-- 		hint = {
-- 			position = "middle",
-- 			border = "rounded",
-- 		},
-- 	},
-- 	mode = "n",
-- 	body = "<Leader>u",
-- 	heads = {
-- 		{ "<Enter>", cmd("Telescope"), { desc = "List all pickers" } },
-- 		{ "<Esc>", nil, { exit = true, nowait = true } },
-- 		{ "q", nil, { exit = true, nowait = true } },
-- 	},
-- })

local telescope_maps = {
	{
		"b",
		function()
			require("telescope.builtin").buffers({ ignore_current_buffer = true, sort_mru = true })
		end,
	},
	{
		"f",
		function()
			require("telescope.builtin").find_files({ follow = true, hidden = false, no_ignore = false })
		end,
	},
	{ "g", require("telescope.builtin").live_grep },
	{ "r", require("telescope.builtin").registers },
	{ "k", require("telescope.builtin").keymaps },
	{
		"/",
		function()
			require("telescope.builtin").current_buffer_fuzzy_find({ skip_empty_lines = true })
		end,
	},
	{ "u", require("telescope.builtin").builtin },
}

for _, mapping in pairs(telescope_maps) do
	vim.keymap.set("n", "<Leader>u" .. mapping[1], mapping[2])
end
