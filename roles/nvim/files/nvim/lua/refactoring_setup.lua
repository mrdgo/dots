local leader_key = "<Leader>r"

local function refactor_map(key, cmd)
    vim.api.nvim_set_keymap("v", leader_key .. key, "<Cmd>lua require'refactoring'.refactor'"..cmd.."'<CR>", {noremap = true, silent = true, expr = false})
end

local refactor = require("refactoring")
refactor.setup()

-- telescope refactoring helper
local function refactoring(prompt_bufnr)
    local content = require("telescope.actions.state").get_selected_entry(
        prompt_bufnr
    )
    require("telescope.actions").close(prompt_bufnr)
    require("refactoring").refactor(content.value)
end
-- NOTE: M is a global object
-- for the sake of simplicity in this example
-- you can extract this function and the helper above
-- and then require the file and call the extracted function
-- in the mappings below


refactor_map("f", "Extract Function")
refactor_map("F", "Extract Function To File")

vim.api.nvim_set_keymap("v", leader_key .. "e", [[<Cmd>lua require'refactoring_setup'.refactors()<CR>]], {noremap = true, silent = true, expr = false})

return {
    refactors = function()
        local opts = require"telescope.themes".get_cursor()
        require"telescope.pickers".new(
            opts,
            {
                prompt_title = "refactors",
                finder = require"telescope.finders".new_table{
                    results = require"refactoring".get_refactors(),
                },
                sorter = require"telescope.config".values.generic_sorter(opts),
                attach_mappings = function(_, map)
                    map("i", "<CR>", refactoring)
                    map("n", "<CR>", refactoring)
                    return true
                end
            }
        ):find()
    end
}
