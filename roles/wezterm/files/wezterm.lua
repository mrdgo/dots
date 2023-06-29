-- Pull in the wezterm API
local wezterm = require("wezterm")

config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("Mononoki Nerd Font")
config.font_size = 13
config.audible_bell = "Disabled"
config.keys = {
	{ key = "+", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	{ key = "=", mods = "CTRL", action = wezterm.action.ResetFontSize },
	{ key = "%", mods = "SUPER|SHIFT", action = wezterm.action.SplitHorizontal({ cwd = "~" }) },
	{ key = "!", mods = "SUPER|SHIFT", action = wezterm.action.SplitVertical({ cwd = "~" }) },
	{ key = "c", mods = "SUPER", action = "ActivateCopyMode" },
	-- { key = "t", mods = "SUPER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
}

config.default_prog = { "/usr/bin/nu" }

config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

config.enable_tab_bar = false
config.cursor_blink_rate = 0
-- color_scheme = "Gruvbox dark, hard (base16)"
config.colors = {
	foreground = "#ebdbb2",
	background = "#161616",
	cursor_fg = "#161616",
	cursor_bg = "#ebdbb2",
	cursor_border = "#282828",
	selection_bg = "#98971a",
	selection_fg = "#161616",
	compose_cursor = "#d65d0e",
	ansi = {
		"#0d0e0f",
		"#cc241d",
		"#98971a",
		"#EEBD35",
		"#458588",
		"#b16286",
		"#689d6a",
		"#928374",
	},
	brights = {
		"#928374",
		"#fb4934",
		"#b8bb26",
		"#fabd2f",
		"#7fa2ac",
		"#D4879C",
		"#8ec07c",
		"#ebdbb2",
	},
}

return config
