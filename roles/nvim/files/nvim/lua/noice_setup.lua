require("noice").setup({
	-- cmdline = {
	-- 	enabled = true, -- disable if you use native command line UI
	-- 	view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
	-- 	opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
	-- 	icons = {
	-- 		["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
	-- 		["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
	-- 		[":"] = { icon = "λ ", hl_group = "DiagnosticInfo", firstc = false },
	-- 	},
	-- },
	cmdline = {
		enabled = true, -- enables the Noice cmdline UI
		view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
		opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
		---@type table<string, CmdlineFormat>
		format = {
			-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
			-- view: (default is cmdline view)
			-- opts: any options passed to the view
			-- icon_hl_group: optional hl_group for the icon
			cmdline = { pattern = "^:", icon = "λ " },
			search_down = { kind = "search", pattern = "^/", icon = " ", ft = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = " ", ft = "regex" },
			filter = { pattern = "^:%s*!", icon = "$", ft = "sh" },
			lua = { pattern = "^:%s*lua%s+", icon = "", ft = "lua" },
			-- lua = false, -- to disable a format, set to `false`
		},
	},
	messages = {
		-- NOTE: If you enable messages, then the cmdline is enabled automatically.
		-- This is a current Neovim limitation.
		enabled = true, -- enables the Noice messages UI
		view = "notify", -- default view for messages
		view_error = "notify", -- view for errors
		view_warn = "notify", -- view for warnings
		view_history = "split", -- view for :messages
		view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
	},
	popupmenu = {
		enabled = true, -- disable if you use something like cmp-cmdline
		---@type 'nui'|'cmp'
		backend = "nui", -- backend to use to show regular cmdline completions
		-- You can specify options for nui under `config.views.popupmenu`
	},
	history = {
		-- options for the message history that you get with `:Noice`
		view = "split",
		opts = { enter = true },
		filter = { event = "msg_show", ["not"] = { kind = { "search_count", "echo" } } },
	},
	notify = {
		-- Noice can be used as `vim.notify` so you can route any notification like other messages
		-- Notification messages have their level and other properties set.
		-- event is always "notify" and kind can be any log level as a string
		-- The default routes will forward notifications to nvim-notify
		-- Benefit of using Noice for this is the routing and consistent history view
		enabled = false,
	},
	throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
	---@type table<string, NoiceViewOptions>
	-- views = {}, -- @see the section on views below
	---@type NoiceRouteConfig[]
	-- routes = {}, -- @see the section on routes below
	---@type table<string, NoiceFilter>
	-- status = {}, --@see the section on statusline components below
	---@type NoiceFormatOptions
	-- format = {}, -- @see section on formatting
})
