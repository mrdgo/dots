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
    map_lsp('R', 'buf.rename()')
    map_lsp('f', 'buf.formatting()')
    map_lsp('a', 'diagnostic.show_line_diagnostics()')
    map_lsp('n', 'diagnostic.goto_next()')
    map_lsp('p', 'diagnostic.goto_prev()')
    map_lsp('td', 'buf.type_definition()')

    local map_tel = function(key, cmd)
      map(key, 'require"telescope.builtin".'..cmd)
    end

    map_tel('r', 'lsp_references()')

    -- Java specific
    local map_jdt = function(key, cmd)
      map(key, 'require"jdtls".' .. cmd)
    end

    map_jdt("oi", "organize_imports()")
    map_jdt("tc", "test_class()")
    map_jdt("tn", "test_nearest_method()")
    -- map_jdt("e", "extract_variable()")

    -- map_jdt("e", "extract_variable(true)")
    -- map_jdt("m", "extract_method(true)")
   end
end

require('jdtls').start_or_attach({
    cmd = {'eclipse.jdt.ls'},
    root_dir = require'jdtls.setup'.find_root{'gradle.build', 'pom.xml'},
    on_attach = on_attach
})

vim.cmd[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePre *.java lua vim.lsp.buf.formatting()
augroup END
]]

