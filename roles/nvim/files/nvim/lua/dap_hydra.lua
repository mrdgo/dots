local Hydra = require("hydra")
local dap = require("dap")
local tel = require("telescope").extensions.dap

local function split()
	dap.repl.toggle({ height = 15 }, "belowright split")
end

local function vsplit()
	dap.repl.toggle({}, "belowright vsplit")
end

Hydra({
	name = "Debug mode",
	mode = "n",
	-- hint = "Debug mode",
	-- config = {
	-- 	color = "teal",
	-- 	invoke_on_body = true,
	-- 	hint = {
	-- 		position = "top",
	-- 		border = "rounded",
	-- 	},
	-- },
	body = "<Leader>e",
	heads = {
		{ "t", split, { desc = "split" } },
		{ "T", vsplit, { desc = "vsplit" } },
		{ "b", dap.toggle_breakpoint, { desc = "breakpoint" } },
		{ "B", tel.list_breakpoints },
		{ "k", dap.up },
		{ "j", dap.down },
		{ "s", dap.step_over },
		{ "i", dap.step_into },
		{ "o", dap.step_out },
		{ "l", dap.run_last, { desc = "run last" } },
		{ "c", dap.continue },
		{ "x", dap.close, { desc = "clase" } },
		{ "h", tel.commands },
		{ "c", tel.configurations },
		{ "v", tel.variables },
		{ "u", require("dapui").toggle, { desc = "dapui" } },
		{ "e", require("dapui").eval, { desc = "eval" } },
	},
})
