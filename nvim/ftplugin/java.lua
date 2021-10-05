-- nvim_lsp["jdtls"].setup(require"coq".lsp_ensure_capabilities{on_attach = on_attach, cmd = {"eclipse.jdt.ls"}})


local on_attach = function(a, bufnr)

  require'lsp_signature'.on_attach(a, bufnr)
  --require'virtualtypes'.on_attach(a, bufnr)

  if (string.find(vim.api.nvim_buf_get_name(bufnr), 'venv_gps') ~= nil)
  then
    -- at least turn off mappings
    return
  else
    local opts = { noremap=false, silent=true }

    local map = function(key, cmd)
        vim.api.nvim_buf_set_keymap(
          bufnr, 'n', '<Leader>s'..key,
          '<cmd>lua '..cmd..'<CR>', opts
        )
    end

    local map_lsp = function(key, cmd)
      map(key, 'vim.lsp.'..cmd)
    end

    map_lsp('k', 'buf.hover()')
    map_lsp('D', 'buf.declaration()')
    map_lsp('d', 'buf.definition()')
    map_lsp('i', 'buf.implementation()')
    map_lsp('s', 'buf.signature_help()')
    map_lsp('t', 'buf.type_definition()')
    map_lsp('R', 'buf.rename()')
    map_lsp('f', 'buf.formatting()')
    map_lsp('a', 'diagnostic.show_line_diagnostics()')
    map_lsp('n', 'diagnostic.goto_next()')
    map_lsp('p', 'diagnostic.goto_prev()')

    local map_tel = function(key, cmd)
      map(key, 'require"telescope.builtin".'..cmd)
    end

    map_tel('r', 'lsp_references()')

    -- Java specific
    --buf_set_keymap("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
    --buf_set_keymap("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
    --buf_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
    --buf_set_keymap("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    --buf_set_keymap("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
    --buf_set_keymap("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
   end
end

require('jdtls').start_or_attach({
    cmd = {'eclipse.jdt.ls'},
    root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'}),
    on_attach = on_attach
})

