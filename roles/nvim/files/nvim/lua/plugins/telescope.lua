return {
	"nvim-telescope/telescope.nvim",
	config = function()
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

						-- ["<C-h>"] = require("telescope").extensions.send_to_harpoon.actions.send_selected_to_harpoon,
					},
					-- i = {
					-- 	["<C-h>"] = require("telescope").extensions.send_to_harpoon.actions.send_selected_to_harpoon,
					-- },
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
					prompt_title = "zoxide",
					mappings = {
						default = {
							after_action = function()
								if vim.api.nvim_buf_get_option(0, "filetype") ~= "alpha" then
									require("alpha").start()
								end
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
		-- require("telescope").load_extension("harpoon")
		require("telescope").load_extension("zoxide")
		require("telescope").load_extension("noice")
		require("telescope").load_extension("tmux")
		-- require("telescope").load_extension("send_to_harpoon")

		local telescope_maps = {
			u = {
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
				{ "p", require("telescope").extensions.zoxide.list },
			},
			g = {
				{ "f", require("telescope.builtin").git_files },
				{ "c", require("telescope.builtin").git_commits },
				{ "l", require("telescope.builtin").git_bcommits },
				{ "s", require("telescope.builtin").git_status },
				{ "b", require("telescope.builtin").git_branches },
				{ "t", require("telescope.builtin").git_stash },
			},
			t = {
				{
					"w",
					function()
						require("telescope").extensions.tmux.windows({})
					end,
				},
				{
					"s",
					function()
						require("telescope").extensions.tmux.sessions({})
					end,
				},
				{
					"p",
					function()
						require("telescope").extensions.tmux.pane_contents({})
					end,
				},
			},
		}

		for leader, mappings in pairs(telescope_maps) do
			for _, mapping in pairs(mappings) do
				vim.keymap.set("n", "<Leader>" .. leader .. mapping[1], mapping[2])
			end
		end
	end,
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzy-native.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"jvgrootveld/telescope-zoxide",
		"camgraff/telescope-tmux.nvim",
		"anuvyklack/hydra.nvim",
		"kazhala/close-buffers.nvim",
		"folke/noice.nvim",
		-- "ThePrimeagen/harpoon",
		-- "asbjornhaland/telescope-send-to-harpoon.nvim",
	},
}
