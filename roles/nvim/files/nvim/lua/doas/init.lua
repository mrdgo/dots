local function _echo_multiline(msg)
	for _, s in ipairs(vim.fn.split(msg, "\n")) do
		vim.cmd("echom '" .. s:gsub("'", "''") .. "'")
	end
end

local function info(msg)
	vim.cmd("echohl Directory")
	_echo_multiline(msg)
	vim.cmd("echohl None")
end

local function warn(msg)
	vim.cmd("echohl WarningMsg")
	_echo_multiline(msg)
	vim.cmd("echohl None")
end

local function err(msg)
	vim.cmd("echohl ErrorMsg")
	_echo_multiline(msg)
	vim.cmd("echohl None")
end

-- local function doas_save()
--     local buf = vim.nvim_get_current_buf()
-- end

local function sudo_exec(cmd, print_output)
	local password = vim.fn.inputsecret("Password: ")
	if not password or #password == 0 then
		warn("Invalid password, sudo aborted")
		return false
	end
	local out = vim.fn.system(string.format("sudo -p '' -S %s", cmd), password)
	if vim.v.shell_error ~= 0 then
		print("\r\n")
		err(out)
		return false
	end
	if print_output then
		print("\r\n", out)
	end
	return true
end

local function sudo_write(tmpfile, filepath)
	if not tmpfile then
		tmpfile = vim.fn.tempname()
	end
	if not filepath then
		filepath = vim.fn.expand("%")
	end
	if not filepath or #filepath == 0 then
		err("E32: No file name")
		return
	end
	-- `bs=1048576` is equivalent to `bs=1M` for GNU dd or `bs=1m` for BSD dd
	-- Both `bs=1M` and `bs=1m` are non-POSIX
	local cmd = string.format("dd if=%s of=%s bs=1048576", vim.fn.shellescape(tmpfile), vim.fn.shellescape(filepath))
	-- no need to check error as this fails the entire function
	vim.api.nvim_exec(string.format("write! %s", tmpfile), true)
	if sudo_exec(cmd) then
		info(string.format('\r\n"%s" written', filepath))
		vim.cmd("e!")
	end
	vim.fn.delete(tmpfile)
end

local function setup()
	vim.api.nvim_set_keymap("n", "<Leader>W", "", {
		callback = sudo_write,
		noremap = true,
		silent = true,
	})
end

return {
	setup = setup,
}
