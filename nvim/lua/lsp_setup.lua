local nvim_lsp = require'lspconfig'
local configs = require'lspconfig/configs'

if not nvim_lsp.emmylua then
  configs.emmylua = {
    default_config = {
      cmd = {'java', '-cp', '$HOME/.local/share/vim-lsp-settings/servers/emmylua-ls/EmmyLua-LS-all.jar', 'com.tang.vscode.MainKt'};
      filetypes = {'lua'};
      root_dir = function(fname)
        return nvim_lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      end;
      settings = {};
    };
  }
end

local on_attach = function(a, bufnr)

  require'completion'.on_attach(a, bufnr)
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

   end
end

local servers = {'pyls', 'vimls', 'texlab', 'hls'}
--local servers = {'pyls', 'vimls', 'texlab', 'hls', 'emmylua'}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
