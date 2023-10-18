return {
	"cbochs/portal.nvim",
	keys = {
		{ "<Leader>O" },
		{ "<Leader>I" },
	},
	config = function()
		vim.keymap.set("n", "<leader>O", "<cmd>Portal jumplist backward<cr>")
		vim.keymap.set("n", "<leader>I", "<cmd>Portal jumplist forward<cr>")
		vim.keymap.set("n", "<leader><leader>a", require("grapple").toggle)
		vim.keymap.set("n", "<leader><leader>o", require("grapple").popup_tags)
	end,
	dependencies = {
		"cbochs/grapple.nvim",
		-- 	"ThePrimeagen/harpoon", -- Optional: provides the "harpoon" query item
	},
}
