return {
	"cbochs/portal.nvim",
	keys = function()
		return {
			{ "<Leader>O", "<cmd>Portal jumplist backward<cr>" },
			{ "<Leader>I", "<cmd>Portal jumplist forward<cr>" },
			{ "<Leader><Leader>a", require("grapple").toggle },
			{ "<Leader><Leader>o", require("grapple").popup_tags },
		}
	end,
	dependencies = {
		"cbochs/grapple.nvim",
		-- 	"ThePrimeagen/harpoon", -- Optional: provides the "harpoon" query item
	},
}
