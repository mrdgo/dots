local Hydra = require("hydra")
local dap = require("dap")
local tel = require("telescope").extensions.dap

local function split()
	dap.repl.toggle({ height = 15 }, "belowright split")
end

local function vsplit()
	dap.repl.toggle({}, "belowright vsplit")
end

-- Hydra({
-- 	name = "Debug mode",
-- 	mode = "n",
-- 	-- hint = "Debug mode",
-- 	-- config = {
-- 	-- 	color = "teal",
-- 	-- 	invoke_on_body = true,
-- 	-- 	hint = {
-- 	-- 		position = "top",
-- 	-- 		border = "rounded",
-- 	-- 	},
-- 	-- },
-- 	body = "<Leader>e",
-- 	heads = {
-- 		{ "t", split, { desc = "split" } },
-- 		{ "T", vsplit, { desc = "vsplit" } },
-- 		{ "b", dap.toggle_breakpoint, { desc = "breakpoint", exit = true } },
-- 		{ "B", tel.list_breakpoints, { exit = true } },
-- 		{ "s", dap.step_over },
-- 		{ "i", dap.step_into },
-- 		{ "o", dap.step_out },
-- 		{ "j", dap.down },
-- 		{ "k", dap.up },
-- 		{ "l", dap.run_last, { desc = "run last" } },
-- 		{ "c", dap.continue, { exit = true } },
-- 		{ "x", dap.close, { desc = "close", exit = true } },
-- 		{ "h", tel.commands },
-- 		{ "c", tel.configurations, { exit = true } },
-- 		{ "v", tel.variables, { exit = true } },
-- 		{ "u", require("dapui").toggle, { desc = "dapui", exit = true } },
-- 		{ "e", require("dapui").eval, { desc = "eval", exit = true } },
-- 		{ "<Esc>", nil, { exit = true, nowait = true } },
-- 		{ "q", nil, { exit = true, nowait = true } },
-- 	},
-- })

local dap_keymaps = {
	{ "t", split, { desc = "split" } },
	{ "T", vsplit, { desc = "vsplit" } },
	{ "b", dap.toggle_breakpoint, { desc = "breakpoint", exit = true } },
	{ "B", tel.list_breakpoints, { desc = "List breakpoints", exit = true } },
	{ "s", dap.step_over, { desc = "Step over" } },
	{ "i", dap.step_into, { desc = "Step into" } },
	{ "o", dap.step_out, { desc = "Step out" } },
	{ "j", dap.down, { desc = "One line down" } },
	{ "k", dap.up, { desc = "One line up" } },
	{ "l", dap.run_last, { desc = "run last" } },
	{ "n", dap.continue, { desc = "Continue/show options", exit = true } },
	{ "x", dap.close, { desc = "close", exit = true } },
	{ "h", tel.commands, { desc = "Show commands" } },
	{ "c", tel.configurations, { desc = "List configurations", exit = true } },
	{ "v", tel.variables, { desc = "List variables", exit = true } },
	{ "u", require("dapui").toggle, { desc = "dapui", exit = true } },
	{ "e", require("dapui").eval, { desc = "eval", exit = true } },
}

for _, key_func in pairs(dap_keymaps) do
	vim.api.nvim_set_keymap("n", "<Leader>e" .. key_func[1], "", {
		noremap = true,
		callback = key_func[2],
		desc = key_func[3].desc,
	})
end
