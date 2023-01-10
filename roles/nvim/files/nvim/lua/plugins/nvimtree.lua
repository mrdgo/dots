return {
	"nvim-tree/nvim-tree.lua",
	config = true,
	opts = {
		sort_by = "case_sensitive",
		view = {
			adaptive_size = true,
			mappings = {
				list = {
					{ key = "u", action = "dir_up" },
					{ key = "s", action = "split" },
					{ key = "v", action = "vsplit" },
					{ key = "S", action = "system_open" },
				},
			},
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
	},
	keys = {
		{ "<Leader>ut", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
