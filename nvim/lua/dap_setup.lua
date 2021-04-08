local dap =  require'dap'

local opts = { noremap=false, silent=true }

local map_dap = function (key, command)
   vim.api.nvim_buf_set_keymap(
       0, 'n', '<Leader>e'..key,
       '<cmd>lua require"dap".'..command..'<CR>',
       opts
   )
end

map_dap('b', 'toggle_breakpoint()')
map_dap('r', 'repl.toggle({}, "belowright split")')
map_dap('vr', 'repl.toggle({}, "belowright vsplit")')

local map_ext = function (key, command)
    vim.api.nvim_buf_set_keymap(
        0, 'n',
        '<Leader>e'..key,
        '<cmd>lua require"telescope".extensions.dap.'..command..'<CR><Esc>',
        opts
    )
end

map_ext('h', 'commands()')
map_ext('c', 'configurations()')
map_ext('B', 'list_breakpoints()')
map_ext('s', 'variables()')

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>eC',
    '<cmd>lua require"dap_setup".reload_continue()<CR><Esc>', opts)

local M = {}

function M.reload_continue()
    package.loaded['dap_python'] = nil
    require'dap_python'
    require'telescope'.extensions.dap.configurations()
end

return M
