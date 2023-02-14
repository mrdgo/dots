return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

		parser_configs.norg = {
			install_info = {
				url = "https://github.com/nvim-neorg/tree-sitter-norg",
				files = { "src/parser.c", "src/scanner.cc" },
				branch = "main",
			},
		}

		parser_configs.robot = {
			install_info = {
				url = "https://github.com/Hubro/tree-sitter-robot",
				files = { "src/parser.c" },
			},
			filetype = "robot",
		}

		vim.g.ts_highlight_lua = true

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"css",
				"haskell",
				"html",
				"java",
				"javascript",
				"json",
				"kotlin",
				"lua",
				"markdown",
				"markdown_inline",
				"norg",
				"python",
				"regex",
				"robot",
				"toml",
				"typescript",
				"vim",
				"yaml",
			},
			highlight = {
				enable = true,
				--disable = { "python" },
			},
			-- TODO: check out treehopper
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					scope_incremental = "<CR>",
					node_incremental = "<TAB>",
					node_decremental = "<S-TAB>",
				},
			},
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = 10000, -- Do not enable for files with more than 1000 lines, int
			},
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
						["aC"] = "@conditional.outer",
						["iC"] = "@conditional.inner",
						["is"] = "@statement.inner",
						["as"] = "@statement.outer",

						-- Or you can define your own textobjects like this
						--["iF"] = {
						--  python = "(function_definition) @function",
						--  cpp = "(function_definition) @function",
						--  c = "(function_definition) @function",
						--  java = "(method_declaration) @function",
					}, -- keymaps
				}, -- select
				swap = {
					enable = true,
					swap_next = {
						["<leader>mp"] = "@parameter.inner",
						["<leader>mf"] = "@function.outer",
						["<leader>me"] = "@element",
					},
					swap_previous = {
						["<leader>mP"] = "@parameter.inner",
						["<leader>mF"] = "@function.outer",
						["<leader>mE"] = "@element",
					},
				},
			}, -- textobjects
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"p00f/nvim-ts-rainbow",
	},
}