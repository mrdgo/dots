local actions = require("telescope.actions")
local previewers = require("telescope.previewers")

local drop_open = {
	["<CR>"] = function(bufnr)
		require("telescope.actions.set").edit(bufnr, "drop")
	end,
}

require("close_buffers").setup({})

require("telescope").setup({
	defaults = {
		borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
		initial_mode = "insert",
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
		file_ignore_patterns = { "node_modules", "ckeditor" },
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
	pickers = {
		buffers = {
			mappings = {
				n = drop_open,
				i = drop_open,
			},
		},
		find_files = {
			mappings = {
				n = drop_open,
				i = drop_open,
			},
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
		-- ["ui-select"] = {
		-- require("telescope.themes").get_dropdown({}),
		-- },
		zoxide = {
			prompt_title = "z",
			mappings = {
				default = {
					after_action = function()
						require("alpha").start()
						require("close_buffers").wipe({ type = "other" })
					end,
				},
			},
		},
	},
})

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("media_files")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("zoxide")

-- vim.cmd([[
-- augroup ChangeDir
-- 	au!
-- 	au DirChanged * lua require("alpha").start()
-- ]])
