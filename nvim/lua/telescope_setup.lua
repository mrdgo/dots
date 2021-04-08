local actions = require'telescope.actions'
local previewers = require'telescope.previewers'
require'telescope'.setup {
    defaults = {
        mappings = {
            n = {
                -- motion
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["d"] = actions.close,

                -- split
                ["s"] = actions.goto_file_selection_split,
                ["v"] = actions.goto_file_selection_vsplit,

                -- TODO: yank filename
                --["y"] = actions.,
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
        prompt_prefix = "λ",
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
map('b', 'buffers({ show_all_buffers = true })')
map('h', 'help_tags()')
map('l', 'current_buffer_fuzzy_find()')
