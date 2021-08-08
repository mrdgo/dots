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
                ["d"] = actions.delete_buffer,
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
        --buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker
    },
    extensions = {
            media_files = {
                filetypes = {'png', 'webp', 'jpg', 'jpeg', 'pdf', 'mp4'},
                find_cmd = 'rg' -- find command (defaults to `fd`)
            },
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
            }
        }
}

--require'telescope'.load_extension'fzy_native'
require'telescope'.load_extension'media_files'


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
