luafile $HOME/.config/nvim/lua/dap_python.lua

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePre *.py lua vim.lsp.buf.formatting()
augroup END
