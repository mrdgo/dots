local test = require("nvim-test")

test.setup({
	commands_create = false,
})

require("nvim-test.runners.pytest"):setup({
	command = "pytest", -- a command to run the test runner
})

local test_maps = {
	tf = function()
		test.run("file")
	end,
	tl = test.run_last,
	tn = function()
		test.run("nearest")
	end,
	ts = function()
		test.run("suite")
	end,
	tv = test.visit,
	ti = test.info,
	te = test.edit,
}

for key, cmd in pairs(test_maps) do
	vim.keymap.set("n", "<Leader>" .. key, cmd, { noremap = false, silent = true })
end
