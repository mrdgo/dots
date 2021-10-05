luafile $HOME/.config/nvim/lua/dap_python.lua

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py lua vim.lsp.buf.formatting()
augroup END
