vim.cmd([[
augroup TrailingWhitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END
]])
