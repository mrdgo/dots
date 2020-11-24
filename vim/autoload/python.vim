" start deoplete
let g:deoplete#enable_at_startup = 1

" close function help after editing
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" split completion window below
set splitbelow

" tab through completion suggestions
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
" let g:jedi#use_splits_not_buffers = "right"
let g:neomake_python_enabled_makers = ['flake8']

" call on write
call neomake#configure#automake('w')

let g:neomake_open_list = 2
let g:neomake_list_height = 4

" Check code as python3 by default
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_virtualtext_current_error = 0
