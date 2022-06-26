-- local dap =  require'dap'

local leader = "<Leader>e"
local dap_mappings = {
	b = "toggle_breakpoint()",
	r = 'repl.toggle({height = 15}, "belowright split")',
	R = 'repl.toggle({}, "belowright vsplit")',
	s = "step_over()",
}

local telescope_mappings = {
	h = "commands()",
	c = "configurations()",
	B = "list_breakpoints()",
	s = "variables()",
}

local opts = { noremap = false, silent = true }

for key, command in pairs(dap_mappings) do
	vim.api.nvim_buf_set_keymap(0, "n", leader .. key, '<cmd>lua require"dap".' .. command .. "<CR>", opts)
end

for key, command in pairs(telescope_mappings) do
	vim.api.nvim_buf_set_keymap(
		0,
		"n",
		leader .. key,
		'<cmd>lua require"telescope".extensions.dap.' .. command .. "<CR><Esc>",
		opts
	)
end
