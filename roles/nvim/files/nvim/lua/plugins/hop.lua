return {
	"phaazon/hop.nvim",
	as = "hop",
	keys = { { "<Leader>f", "<cmd>HopChar1MW<cr>", desc = "Hop" } },
	config = true,
	opts = {
		inclusive_jump = false,
		uppercase_labels = false,
		create_hl_autocmd = true,
	},
}
