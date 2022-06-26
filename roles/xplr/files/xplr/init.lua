version = "0.19.0"
local xplr = xplr

package.path = os.getenv("HOME") .. "/.config/xplr/lua/?.lua"

-- function I found to display icons from lua code
do
	local bytemarkers = { { 0x7FF, 192 }, { 0xFFFF, 224 }, { 0x1FFFFF, 240 } }
	function utf8(decimal)
		if decimal < 128 then
			return string.char(decimal)
		end
		local charbytes = {}
		for bytes, vals in ipairs(bytemarkers) do
			if decimal <= vals[1] then
				for b = bytes + 1, 2, -1 do
					local mod = decimal % 64
					decimal = (decimal - mod) / 64
					charbytes[b] = string.char(128 + mod)
				end
				charbytes[1] = string.char(vals[2] + decimal)
				break
			end
		end
		return table.concat(charbytes)
	end
end

xplr.config.general.initial_layout = "no_help_no_selection"

xplr.config.node_types.directory.meta.icon = " " .. utf8(0xf07c) .. " "
xplr.config.node_types.file.meta.icon = " " .. utf8(0xf15c) .. " "
xplr.config.node_types.symlink.meta.icon = " " .. utf8(0xf0c1) .. " "

xplr.config.node_types.directory.style.fg = "Blue"
xplr.config.node_types.file.style.fg = "LightGreen"
xplr.config.node_types.symlink.style.fg = "LightMagenta"

xplr.config.general.selection_ui.style.fg = "LightYellow"
xplr.config.general.focus_ui.style.fg = "Yellow"

xplr.config.modes.builtin["action"].key_bindings.on_key["!"] = {
	help = "shell",
	messages = {
		{
			Call = {
				command = "zsh",
				args = { "-i" },
			},
		},
		"ExplorePwdAsync",
		"PopMode",
	},
}
xplr.config.modes.builtin["action"].key_bindings.on_key["v"] = {
	help = "view pdf regular",
	messages = {
		{
			BashExec = [===[
            devour zathura "${XPLR_FOCUS_PATH:?}"
            ]===],
		},
		"PopMode",
	},
}

xplr.config.modes.builtin["action"].key_bindings.on_key["o"] = {
	help = "open pdf in okular",
	messages = {
		{
			BashExec = [===[
            devour okular "${XPLR_FOCUS_PATH:?}"
            ]===],
		},
		"PopMode",
	},
}

xplr.config.modes.builtin["action"].key_bindings.on_key["d"] = {
	help = "display svg",
	messages = {
		{
			BashExec = [===[
            devour display "${XPLR_FOCUS_PATH:?}"
            ]===],
		},
		"PopMode",
	},
}

-- Press `:p` to toggle preview mode.
require("nnn_preview_wrapper").setup({
	plugin_path = "/home/maxim/.config/nnn/plugins/preview-tabbed",
	fifo_path = "/tmp/xplr.fifo",
	mode = "action",
	key = "p",
})

-- Type `yy` to copy and `p` to paste whole files.
-- Type `yp` to copy the paths of focused or selected files.
-- Type `yP` to copy the parent directory path.
require("xclip").setup({
	copy_command = "xclip-copyfile",
	copy_paths_command = "xclip -sel clip",
	paste_command = "xclip-pastefile",
	keep_selection = false,
})
