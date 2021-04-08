"""""""""""""" airline
if exists('g:started_by_firenvim')
    au VimEnter * AirlineToggle
else
    let g:airline#extensions#tabline#enabled = 0
    let g:airline#extensions#tabline#buffer_nr_show = 0
    let g:airline#extensions#hunks#non_zero_only = 1
endif
let g:airline_skip_empty_sections = 1

let g:airline#extensions#lsp#enabled = 0
let g:airline#extensions#nvimlsp#enabled = 0
