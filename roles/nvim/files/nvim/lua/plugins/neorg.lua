return {
	"nvim-neorg/neorg",
	opts = {
		-- Tell Neorg what modules to load
		load = {
			["core.defaults"] = {}, -- Load all the default modules
			["core.concealer"] = {}, -- Allows for use of icons
			["core.dirman"] = { -- Manage your directories with Neorg
				config = {
					workspaces = {
						my_workspace = "~/neorg",
					},
				},
			},
		},
	},

	-- Listen for the enable_keybinds event, which signals a "ready" state meaning we can bind keys.
	-- This hook will be called several times, e.g. whenever the Neorg Mode changes or an event that
	-- needs to reevaluate all the bound keys is invoked

	-- local neorg_callbacks = require("neorg.callbacks")
	-- neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
	-- 	-- Map all the below keybinds only when the "norg" mode is active
	-- 	keybinds.map_event_to_mode("norg", {
	-- 		n = { -- Bind keys in normal mode
	--
	-- 			-- Keys for managing TODO items and setting their states
	-- 			{ "gtd", "core.norg.qol.todo_items.todo.task_done" },
	-- 			{ "gtu", "core.norg.qol.todo_items.todo.task_undone" },
	-- 			{ "gtp", "core.norg.qol.todo_items.todo.task_pending" },
	-- 			{ "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" },
	-- 		},
	-- 	}, { silent = true, noremap = true })
	-- end)
	-- end,
	ft = "norg",
	dependencies = { "nvim-lua/plenary.nvim" },
}
