local leader_key = "<Leader>r"

local refactor = require("refactoring")
refactor.setup()

-- telescope refactoring helper
local function refactoring(prompt_bufnr)
	local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
	require("telescope.actions").close(prompt_bufnr)
	require("refactoring").refactor(content.value)
end

local function refactor_map(key, cmd)
	vim.api.nvim_set_keymap(
		"v",
		leader_key .. key,
		"<Cmd>lua require'refactoring'.refactor'" .. cmd .. "'<CR>",
		{ noremap = true, silent = true, expr = false }
	)
end

refactor_map("f", "Extract Function")
refactor_map("F", "Extract Function To File")

vim.api.nvim_set_keymap(
	"v",
	leader_key .. "e",
	[[<Cmd>lua require'refactoring_setup'.refactors()<CR>]],
	{ noremap = true, silent = true, expr = false }
)

local function debug_map(key, below)
	vim.api.nvim_set_keymap(
		"n",
		leader_key .. key,
		'<Cmd>lua require"refactoring".debug.printf({below = ' .. tostring(below) .. "})<CR>",
		{ noremap = true, silent = true, expr = false }
	)
end

debug_map("p", true)
debug_map("P", false)

return {
	refactors = function()
		local opts = require("telescope.themes").get_cursor()
		require("telescope.pickers").new(opts, {
			prompt_title = "refactors",
			finder = require("telescope.finders").new_table({
				results = require("refactoring").get_refactors(),
			}),
			sorter = require("telescope.config").values.generic_sorter(opts),
			attach_mappings = function(_, map)
				map("i", "<CR>", refactoring)
				map("n", "<CR>", refactoring)
				return true
			end,
		}):find()
	end,
}
