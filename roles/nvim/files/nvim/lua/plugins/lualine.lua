return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opt = true },
		"WhoIsSethDaniel/lualine-lsp-progress",
		"chrisgrieser/nvim-recorder",
		"cbochs/grapple.nvim",
	},
	config = function()
		local config = {
			options = {
				theme = "gruvbox",
				component_separators = "|",
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ "mode", right_padding = 2 },
				},
				lualine_b = {
					"filename",
					"branch",
					{
						function()
							local key = require("grapple").key()
							return "  [" .. key .. "]"
						end,
						cond = require("grapple").exists,
					},
				},
				lualine_c = {
					"fileformat",
					-- {
					-- 	function()
					-- 		local tabs = io.popen([[~/.config/nvim/get_tmux_info.sh]])
					-- 		-- TODO: transform to bubbles
					-- 		if tabs == nil then
					-- 			return ""
					-- 		end
					--
					-- 		return tabs.read(tabs, "*l")
					-- 	end,
					-- 	cond = function()
					-- 		-- check if TERM_PROGRAM == tmux
					-- 		return os.getenv("TERM_PROGRAM") == "tmux"
					-- 	end,
					-- },
				},
				lualine_x = { require("recorder").displaySlots, "diff", "diagnostics", "searchcount" },
				lualine_y = { "filetype", "progress" },
				-- lualine_y = { "lsp_progress", "filetype", "progress" },
				lualine_z = {
					{ require("recorder").recordingStatus, "location", left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{ "location" },
				},
			},
			tabline = {},
			extensions = {
				"quickfix",
				"nvim-tree",
				"lazy",
				"toggleterm",
				"nvim-dap-ui",
			},
		}

		-- Inserts a component in lualine_c in left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x in right section
		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		-- Color for highlights
		local colors = {
			yellow = "#fabd2f",
			cyan = "#689d6a",
			darkblue = "#458588",
			green = "#b8bb26",
			orange = "#fe8019",
			violet = "#b16286",
			magenta = "#d4879c",
			blue = "#7fa2ac",
			red = "#fb4934",
		}

		-- ins_left({
		-- 	"lsp_progress",
		-- 	colors = {
		-- 		percentage = colors.cyan,
		-- 		title = colors.cyan,
		-- 		message = colors.cyan,
		-- 		spinner = colors.cyan,
		-- 		lsp_client_name = colors.magenta,
		-- 		use = true,
		-- 	},
		-- 	separators = {
		-- 		component = " ",
		-- 		progress = " | ",
		-- 		message = { pre = "(", post = ")" },
		-- 		percentage = { pre = "", post = "%% " },
		-- 		title = { pre = "", post = ": " },
		-- 		lsp_client_name = { pre = "[", post = "]" },
		-- 		spinner = { pre = "", post = "" },
		-- 	},
		-- 	display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
		-- 	timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
		-- 	spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
		-- 	message = { initializing = "Initializing…", commenced = "In Progress", completed = "Completed" },
		-- 	max_message_length = 30,
		-- })

		require("lualine").setup(config)
	end,
}
