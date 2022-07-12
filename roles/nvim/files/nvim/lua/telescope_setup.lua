local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,

				["s"] = actions.file_split,
				["v"] = actions.file_vsplit,

				-- select
				["t"] = actions.toggle_selection,

				-- TODO: yank filename
				--["y"] = actions.,
				["d"] = actions.delete_buffer,
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "λ ",
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
		path_display = { "smart" },
		history = {
			path = "~/.config/nvim/databases/telescope_history.sqlite3",
			limit = 100,
		},
	},
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg", "pdf", "mp4" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
		fzy_native = {
			override_generic_sorter = true,
			override_file_sorter = true,
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("media_files")
require("telescope").load_extension("ui-select")
