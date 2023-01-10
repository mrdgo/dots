return {
	"ThePrimeagen/refactoring.nvim",
	keys = {
		{
			"<Leader>rr",
			function()
				require("refactoring").select_refactor()
			end,
			mode = "v",
			noremap = true,
			silent = true,
			expr = false,
		},
		{
			"<Leader>rp",
			function()
				require("refactoring").debug.printf()
			end,
			desc = "Printf debug statement",
		},
	},
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
