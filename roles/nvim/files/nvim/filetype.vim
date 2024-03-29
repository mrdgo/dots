" myfiletypefile
augroup FormatAutogroup
    autocmd!
    autocmd BufRead,BufNewFile *.gnuplot set filetype=gnuplot
    autocmd BufRead,BufNewFile xmobarrc set filetype=haskell
    autocmd BufRead,BufNewFile *aliases set filetype=zsh
    autocmd BufRead,BufNewFile config/zathura/zathurarc set ft=zsh
    autocmd BufRead,BufNewFile *.e2 set ft=e2
    autocmd BufRead,BufNewFile *.ir set ft=e2ir
    autocmd BufRead,BufNewFile docker-compose.yml set ft=yaml.docker-compose
    autocmd BufRead,BufNewFile docker-compose.yaml set ft=yaml.docker-compose
augroup END
