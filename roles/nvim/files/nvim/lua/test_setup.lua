local test = require("nvim-test")

test.setup({
	commands_create = false,
})

require("nvim-test.runners.pytest"):setup({
	command = { (vim.env.VIRTUAL_ENV or "venv") .. "/bin/pytest", "pytest" },
	file_pattern = "\\v(test_[^.]+|[^.]+_test|tests)\\.py$",
	find_files = { "test_{name}.py", "{name}_test.py", "tests.py" },
})

local test_maps = {
	f = function()
		test.run("file")
	end,
	l = test.run_last,
	n = function()
		test.run("nearest")
	end,
	s = function()
		test.run("suite")
	end,
	v = test.visit,
	i = test.info,
	e = test.edit,
}

for key, cmd in pairs(test_maps) do
	vim.keymap.set("n", "<Leader>t" .. key, cmd, { noremap = false, silent = true })
end
