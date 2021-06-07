local actions = require'telescope.actions'
local previewers = require'telescope.previewers'
require'telescope'.setup {
    defaults = {
        mappings = {
            n = {
                -- motion
                ["q"] = actions.close,

                -- split
                ["s"] = actions.file_split,
                ["v"] = actions.file_vsplit,

                -- select
                ["t"] = actions.toggle_selection,

                -- TODO: yank filename
                --["y"] = actions.,
                ["d"] = function(prompt_bufnr)
                      local action_state = require'telescope.actions.state'
                      local actions = require'telescope.actions'
                      local current_picker = action_state.get_current_picker(prompt_bufnr)
                      local multi_selections = current_picker:get_multi_selection()

                      if next(multi_selections) == nil then
                        local selection = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        vim.api.nvim_buf_delete(selection.bufnr, {force = true})
                      else
                        actions.close(prompt_bufnr)
                        for _, selection in ipairs(multi_selections) do
                          vim.api.nvim_buf_delete(selection.bufnr, {force = true})
                        end
                      end
                      -- assumption: I only use 'd' when searching buffers
                      require'telescope.builtin'.buffers({ignore_current_buffer = true})

                    return true
                end,
            },
        },
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case'
        },
        prompt_prefix = "λ ",
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
    }
}

require'telescope'.load_extension'fzy_native'


local map = function(key, cmd)
    local opts = { noremap=false, silent=true }
    vim.api.nvim_set_keymap(
        'n', '<Leader>u'..key,
        '<cmd>lua require"telescope.builtin".'..cmd..'<CR>', opts
    )

end


map('f', 'find_files()')
map('g', 'live_grep()')
map('b', 'buffers({ignore_current_buffer = true})')
map('h', 'help_tags()')
map('l', 'current_buffer_fuzzy_find()')
