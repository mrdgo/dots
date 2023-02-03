return {
	{ "zsugabubus/crazy8.nvim" },
	{ "tpope/vim-endwise" },
	{ "tpope/vim-repeat" },
	{ "seandewar/nvimesweeper" },
	{ "godlygeek/tabular" },
	{ "uga-rosa/ccc.nvim", config = true },
	{ "kwakzalver/duckytype.nvim", config = true },
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	{ "kylechui/nvim-surround", config = true },
	{ "karb94/neoscroll.nvim", config = true },
	{ "Aasim-A/scrollEOF.nvim", config = true },
	{ "shortcuts/no-neck-pain.nvim", version = "*", config = true },
	{ "EtiamNullam/deferred-clipboard.nvim", config = true, opts = { lazy = true } },
	-- 	{ -- TODO: check out
	-- 	"chrisgrieser/nvim-various-textobjs",
	-- 	config = function ()
	-- 		require("various-textobjs").setup({ useDefaultKeymaps = true })
	-- 	end,
	-- },
	{
		"barrett-ruth/import-cost.nvim",
		build = "sh install.sh npm",
		config = true,
	},
	{
		"xiyaowong/nvim-cursorword",
		config = function()
			vim.cmd([[let g:cursorword_disable_at_startup = v:false]])
		end,
	},
	{
		"princejoogie/chafa.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"m00qek/baleia.nvim",
		},
		config = true,
		opts = {
			render = {
				min_padding = 5,
				show_label = true,
			},
			events = {
				update_on_nvim_resize = true,
			},
		},
	},
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup({})
		end,
	},
	{ "sQVe/sort.nvim", config = true },
	{
		"melkster/modicator.nvim",
		dependencies = { "gruvbox.nvim" },
		config = function()
			vim.o.cursorline = true
			vim.o.number = true
			require("modicator").setup()
		end,
	},
	{ "windwp/nvim-autopairs", dependencies = { "hrsh7th/nvim-cmp" }, config = true },
	{
		"xorid/swap-split.nvim",
		keys = {
			{
				"<Leader>S",
				function()
					require("swap-split").swap()
				end,
				{},
			},
		},
	},
	{
		"0x00-ketsu/maximizer.nvim",
		config = true,
		keys = {
			{
				"<Leader>mt",
				function()
					require("maximizer").toggle()
				end,
				silent = true,
				noremap = true,
			},
		},
	},
	{
		"max397574/better-escape.nvim",
		keys = { { "jk", mode = "i", desc = "Better escape" } },
		config = true,
		opts = {
			mapping = { "jk" },
			timeout = vim.o.timeoutlen,
			clear_empty_lines = false,
			keys = "<Esc>",
		},
	},
	{
		"LhKipp/nvim-nu",
		config = function()
			require("nu").setup({})
		end,
		build = function()
			vim.cmd([[TSInstall nu]])
		end,
	},
}
