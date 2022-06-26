require("dapui").setup({
	layouts = {
		{
			elements = {
				"scopes",
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 10,
			position = "bottom",
		},
	},
	icons = {
		expanded = "⯆",
		collapsed = "⯈",
	},
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	expand_lines = vim.fn.has("nvim-0.7"),
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "rounded", -- Border style. Can be "single", "double" or "rounded"
		mappings = { close = { "q", "<Esc>" } },
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	},
})

local opts = { noremap = false, silent = true }
local map_dapui = function(mode, key, command)
	vim.api.nvim_buf_set_keymap(0, mode, "<Leader>e" .. key, '<cmd>lua require"dapui".' .. command .. "<CR>", opts)
end

map_dapui("n", "u", "toggle()")
map_dapui("v", "e", "eval()")
