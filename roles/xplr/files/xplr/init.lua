version = "0.21.1"
local xplr = xplr
local home = os.getenv("HOME")

package.path = home .. "/.config/xplr/lua/?.lua"
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path .. ";" .. xpm_path .. "/?.lua;" .. xpm_path .. "/?/init.lua"

os.execute(string.format("[ -e '%s' ] || git clone '%s' '%s'", xpm_path, xpm_url, xpm_path))

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

-- xplr.config.general.initial_layout = "no_help_no_selection"

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

local function preview_setup()
	-- Press `:p` to toggle preview mode.
	require("nnn_preview_wrapper").setup({
		plugin_path = "/home/maxim/.config/nnn/plugins/preview-tabbed",
		fifo_path = "/tmp/xplr.fifo",
		mode = "action",
		key = "p",
	})
end

local function setup_xclip()
	-- Type `yy` to copy and `p` to paste whole files.
	-- Type `yp` to copy the paths of focused or selected files.
	-- Type `yP` to copy the parent directory path.
	require("xclip").setup({
		copy_command = "xclip-copyfile",
		copy_paths_command = "xclip -sel clip",
		paste_command = "xclip-pastefile",
		keep_selection = false,
	})
end

require("xpm").setup({
	plugins = {
		-- Let xpm manage itself
		"dtomvan/xpm.xplr",
		{ name = "sayanarijit/preview-tabbed.xplr", after = preview_setup },
		{ name = "sayanarijit/zoxide.xplr" },
		{
			name = "sayanarijit/tri-pane.xplr",
			after = function()
				require("tri-pane").setup({
					layout_key = "T", -- In switch_layout mode
					as_default_layout = true,
					left_pane_width = { Percentage = 20 },
					middle_pane_width = { Percentage = 50 },
					right_pane_width = { Percentage = 30 },
				})
			end,
		},
		{ name = "sayanarijit/xclip.xplr", after = setup_xclip },
		{
			name = "sayanarijit/nvim-ctrl.xplr",
			after = function()
				require("nvim-ctrl").setup({
					mode = "default",
					keys = {
						["ctrl-e"] = "tabedit",
						["e"] = "e",
					},
				})
			end,
		},
	},
	auto_install = true,
	auto_cleanup = true,
})

-- {
--     -- Default: Skip if empty
--     "<name>",
--
--     -- Default: Skip if empty
--     name = "<name>",
--
--     -- Branch, commit or tag to pin
--     -- Default: "origin"
--     rev = "<revision>"
--
--     -- Default: empty
--     after = function() end,
--
--     -- Default: empty
--     before = function() end,
--
--     -- Default: require("<name>").setup()
--     setup = function() end,
--
--     -- Default: empty
--     -- WARNING: if any of the dependencies fail to download, the plugin won't
--     -- load to prevent from any damage being done
--     deps = { "dtomvan/xpm.xplr" }
-- }
