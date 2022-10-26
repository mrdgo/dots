local dap = require("dap")

local mldir = "/home/maxim/tryb/ml-backend/"

local function py_path()
	return mldir .. ".tox/py38-test/bin/python"
end

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Cloud storage test",
		program = mldir .. "python/gps/gps_main.py",
		args = {
			"--mode=train",
			"--local_run",
			"--job-dir=gs://lea-gps-data-storage/gps",
			"-v",
			"--save_samples",
			"--out_dir",
			"24808c6b-5ef0-48e7-9125-9a7ce6ce7c55",
			"pigps_pigps_leaOneDof",
		},
		console = dap.integratedTerminal,
		pythonPath = py_path,
	},
	{
		type = "python",
		request = "launch",
		name = "Pipeline integration test",
		program = mldir .. "python/gps/gps_main.py",
		args = {
			"--mode=train",
			"--out_dir",
			"unittests",
			"--verbose",
			"pigps_pigps_cartpole_test",
		},
		console = dap.integratedTerminal,
		pythonPath = py_path,
	},
}

dap.adapters.python = {
	type = "executable",
	command = "/usr/bin/python",
	args = { "-m", "debugpy.adapter" },
}

vim.api.nvim_set_keymap("n", "<Leader>eC", "", {
	noremap = false,
	callback = function()
		package.loaded["dap_python"] = nil
		require("dap_python")
		require("telescope").extensions.dap.configurations()
	end,
})
