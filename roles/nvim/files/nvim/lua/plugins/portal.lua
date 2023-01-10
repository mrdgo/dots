return {
	"cbochs/portal.nvim",
	keys = {
		{
			"<Leader>O",
			function()
				require("portal").jump_backward()
			end,
		},
		{
			"<Leader>I",
			function()
				require("portal").jump_forward()
			end,
		},
	},
	-- dependencies = {
	-- 	"cbochs/grapple.nvim", -- Optional: provides the "grapple" query item
	-- 	"ThePrimeagen/harpoon", -- Optional: provides the "harpoon" query item
	-- },
}
