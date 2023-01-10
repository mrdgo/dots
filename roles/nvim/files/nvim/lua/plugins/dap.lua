local function split()
	require("dap").repl.toggle({ height = 15 }, "belowright split")
end

local function vsplit()
	require("dap").repl.toggle({}, "belowright vsplit")
end

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-telescope/telescope-dap.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<Leader>et", split, { desc = "split" } },
		{ "<Leader>eT", vsplit, { desc = "vsplit" } },
		{
			"<Leader>eb",
			function()
				require("dap").toggle_breakpoint()
			end,
			{ desc = "breakpoint", exit = true },
		},
		{
			"<Leader>es",
			function()
				require("dap").step_over()
			end,
			{ desc = "Step over" },
		},
		{
			"<Leader>ei",
			function()
				require("dap").step_into()
			end,
			{ desc = "Step into" },
		},
		{
			"<Leader>eo",
			function()
				require("dap").step_out()
			end,
			{ desc = "Step out" },
		},
		{
			"<Leader>ej",
			function()
				require("dap").down()
			end,
			{ desc = "One line down" },
		},
		{
			"<Leader>ek",
			function()
				require("dap").up()
			end,
			{ desc = "One line up" },
		},
		{
			"<Leader>el",
			function()
				require("dap").run_last()
			end,
			{ desc = "run last" },
		},
		{
			"<Leader>en",
			function()
				require("dap").continue()
			end,
			{ desc = "Continue/show options", exit = true },
		},
		{
			"<Leader>ex",
			function()
				require("dap").close()
			end,
			{ desc = "close", exit = true },
		},
		{
			"<Leader>eB",
			function()
				require("telescope").extensions.dap.list_breakpoints()
			end,
			{ desc = "List breakpoints", exit = true },
		},
		{
			"<Leader>eh",
			function()
				require("telescope").extensions.dap.commands()
			end,
			{ desc = "Show commands" },
		},
		{
			"<Leader>ec",
			function()
				require("telescope").extensions.dap.configurations()
			end,
			{ desc = "List configurations", exit = true },
		},
		{
			"<Leader>ev",
			function()
				require("telescope").extensions.dap.variables()
			end,
			{ desc = "List variables", exit = true },
		},
	},
}
