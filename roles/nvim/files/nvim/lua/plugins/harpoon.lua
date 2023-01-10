return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<Leader>a",
			function()
				require("harpoon.mark").add_file()
			end,
		},
		{
			"<Leader>o",
			function()
				require("telescope").extensions.harpoon.marks()
			end,
		},
	},
	config = true,
	opts = {
		mark_branch = true,
	},
}
