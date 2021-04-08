" close function help after editing
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
