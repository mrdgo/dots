-- complete.nvim

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

function _G.shift_smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-p>' or t'<S-Tab>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.shift_smart_tab()', {expr = true, noremap = true})

vim.g.completion_matching_smart_case = 1
vim.g.completion_enable_snippet = 'snippets.nvim'

vim.opt.shortmess:append'c'
vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}

vim.g.completion_enable_auto_popup = 0
vim.api.nvim_set_keymap('i', '<tab>', '<Plug>(completion_smart_tab)', { noremap=false, silent=true })
vim.api.nvim_set_keymap('i', '<s-tab>', '<Plug>(completion_smart_s_tab)', { noremap=false, silent=true })

-- <c-h> will either expand the current snippet at the word or try to jump to
-- the next position for the snippet.
vim.api.nvim_set_keymap('n', '<Leader>nn',
    '<Cmd>lua return require"snippets".expand_or_advance(1)<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('i', '<C-h>',
    '<Cmd>lua return require"snippets".expand_or_advance(1)<CR>', { noremap=true, silent=true })

-- <c-t> will jump backwards to the previous field.
-- If you jump before the first field, it will cancel the snippet.
vim.api.nvim_set_keymap('n', '<Leader>pp',
    '<Cmd>lua return require"snippets".expand_or_advance(-1)<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('i', '<C-t>',
    '<Cmd>lua return require"snippets".expand_or_advance(-1)<CR>', { noremap=true, silent=true })
