" myfiletypefile
augroup FormatAutogroup
    autocmd!
    autocmd BufRead,BufNewFile *.gnuplot set filetype=gnuplot
    autocmd BufRead,BufNewFile xmobarrc set filetype=haskell
    autocmd BufRead,BufNewFile *aliases set filetype=zsh
    autocmd BufRead,BufNewFile config/zathura/zathurarc set ft=zsh
augroup END
